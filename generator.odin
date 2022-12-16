package openxr_odin

// The following changes were made to xr.xml to ensure encoding/xml could parse it.
// 1. Lines 2-4 inclusive were commented out
// 2. Elements with attribute values multiple lines (typically long descriptions) were collapsed onto single lines

import "core:encoding/xml"
import "core:fmt"
import "core:strings"
import "core:os"


KNOWN_SUFFIXES :: [?]string{"KHR", "EXT", "FB", "MSFT", "HTC", "META", "ULTRALEAP", "EXTX", "ALMALENCE"}


main :: proc() {
	doc, err := xml.load_from_file("xr.xml")
	if err != .None {
		fmt.println("Failed to Parse xr.xml, error", err)
		return
	}

	// Prepass extensions info
	// TODO: Get Constants from extensions
	// TODO: Prepass in enums, build dict of all extended enums to get full definitions
	// TODO: Handle XrSwapchainUsageFlagBits special case (only vendor extended bitmask)

	// Get struct arrays
	// TODO: Parse struct fields for arrayness and length
	
	// Generate functions
	// TODO: Generate dummy function pointer types
	// TODO: Generate function signatures
	// TODO: Generate CreateFooBar : ProcCreateFooBar members
	
	// Write loader
	// TODO: Link GetInstanceProcAddress
	// TODO: Gather all instance, device functions and write procs to load in fn pointers

	gen_core_odin(doc)
	gen_enums_odin(doc)
	gen_structs_odin(doc)
	gen_procedures_odin(doc)
}

el_get_attrib :: proc(el: xml.Element, key: string) -> string {
	for attr in el.attribs {
		if attr.key != key {continue}
		return attr.val
	}
	panic(fmt.tprintln("attribute not found on element:", key))
}

el_try_get_attrib :: proc(el: xml.Element, key: string) -> (string, bool) {
	for attr in el.attribs {
		if attr.key != key {continue}
		return attr.val, true
	}
	return "", false
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               CORE.ODIN                                                                 //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CORE_HELPERS :: `
// Version Helpers
CURRENT_API_VERSION :: (1<<48) | (0<<12) | (32)
MAKE_VERSION :: proc(major, minor, patch: u64) -> u64 {
    return (major<<48) | (minor<<32) | (patch)
}

// Base Types
Handle          :: distinct rawptr
Atom            :: distinct u64
Flags64         :: distinct u64
Time            :: i64
Duration        :: i64
Version         :: u64

// Atom Types
Path                    :: distinct Atom
SystemId                :: distinct Atom
ControllerModelKeyMSFT  :: distinct Atom
AsyncRequestIdFB        :: distinct Atom
RenderModelKeyFB        :: distinct Atom

SetProcAddressType :: #type proc(p: rawptr, name: cstring)

`

// Generates the full core.odin file and writes it out
gen_core_odin :: proc(doc: ^xml.Document) {
	builder := strings.builder_make()
	strings.write_string(&builder, "package openxr\n")
	strings.write_string(&builder, CORE_HELPERS)

	for id in doc.elements[0].children {
		el := doc.elements[id]
		el_name, ok := el_try_get_attrib(el, "name")
		if el.ident != "enums" || el_name != "API Constants" {continue}
		gen_constants(&builder, doc, el)
	}

	for id in doc.elements[0].children {
		el := doc.elements[id]
		if el.ident != "types" {continue}
		gen_core_types(&builder, doc, el)
	}

	for id in doc.elements[0].children {
		el := doc.elements[id]
		if el.ident != "extensions" {continue}
		gen_extension_constants(&builder, doc, el)
	}

	os.write_entire_file("openxr/core.odin", builder.buf[:])
}

// Generates odin constants from the "API Constants" <enums> element
gen_constants :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	strings.write_string(builder, "// Base constants\n")

	for child in el.children {
		gen_constant(builder, doc, doc.elements[child])
	}
	strings.write_string(builder, "\n")
}

// Generate an odin constant from an <enum>
gen_constant :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	full_name := el_get_attrib(el, "name")
	name := strings.trim_prefix(full_name, "XR_")
	value := el_get_attrib(el, "value")

	if name == "TRUE" || name == "FALSE" {
		return
	}

	strings.write_string(builder, fmt.aprintln(name, "::", value))
}

// Generates odin constants from the "API Constants" <enums> element
gen_core_types :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	strings.write_string(builder, "// Handle Types\n")

	for child in el.children {
		elem := doc.elements[child]
		category, _ := el_try_get_attrib(elem, "category")
		if category != "handle" {continue}

		full_name := doc.elements[elem.children[1]].value
		name := strings.trim_left(full_name, "Xr")
		strings.write_string(builder, fmt.aprintf("{} :: distinct Handle\n", name))
	}

	strings.write_string(builder, "\n")
}

// Generates odin constants from the <extensions> element
gen_extension_constants :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	strings.write_string(builder, "// Extension constants\n")

	for child in el.children {
		gen_extension_constant(builder, doc, doc.elements[child])
	}
	strings.write_string(builder, "\n")
}

// Generates odin constants from the <extensions> element
gen_extension_constant :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	full_name := el_get_attrib(el, "name")
	name := strings.trim_prefix(full_name, "XR_")
	number := el_get_attrib(el, "number")
	spec_element := doc.elements[doc.elements[el.children[0]].children[0]]
	spec_version := el_get_attrib(spec_element, "value")
	screaming_name := strings.to_screaming_snake_case(name)

	strings.write_string(builder, fmt.aprintf("{} :: {}\n", name, number))
	strings.write_string(builder, fmt.aprintf("{}_SPEC_VERSION :: {}\n", screaming_name, spec_version))
	strings.write_string(builder, fmt.aprintf("{}_EXTENSION_NAME :: \"{}\"\n", screaming_name, full_name))
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               ENUMS.ODIN                                                                //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Generates the full enums.odin file and writes it out
gen_enums_odin :: proc(doc: ^xml.Document) {
	builder := strings.builder_make()
	strings.write_string(&builder, "package openxr\n\n")
	strings.write_string(&builder, "import \"core:c\"\n\n")

	for id in doc.elements[0].children {
		el := doc.elements[id]
		if el.ident != "enums" {continue}
		gen_enums(&builder, doc, el)
	}

	os.write_entire_file("openxr/enums.odin", builder.buf[:])
}

// Generates odin code from an <enums> element
gen_enums :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	el_name := el_get_attrib(el, "name")

	// Handle API Constants special case
	if el_name == "API Constants" {return}

	// Handle actual enums
	el_type := el_get_attrib(el, "type")
	if el_type == "enum" {
		gen_enums_enum(builder, doc, el)
		return
	} else if el_type == "bitmask" {
		gen_enums_bitfield(builder, doc, el)
		return
	}

	panic(fmt.tprintln("Unknown <enums> of type", el_type))
}


// Generates an odin enum type from an <enums> element of type="enum"
gen_enums_enum :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	full_name := el_get_attrib(el, "name")
	name := strings.trim_prefix(full_name, "Xr")
	prefix, suffix := enum_name_to_prefix_suffix(full_name)

	strings.write_string(builder, fmt.aprintf("{} :: enum c.int {{\n", name))

	for child in el.children {
		gen_enums_enum_value(builder, doc, doc.elements[child], prefix, suffix)
	}

	strings.write_string(builder, "}\n\n")
}

gen_enums_enum_value :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element, prefix, suffix: string) {
	if el.ident != "enum" {
		return
	}

	name := strings.trim_prefix(strings.trim_suffix(el_get_attrib(el, "name"), suffix), prefix)
	value := el_get_attrib(el, "value")
	comment, has_comment := el_try_get_attrib(el, "comment")

	strings.write_string(builder, fmt.aprintf("\t{} = {},", name, value))
	if has_comment {
		strings.write_string(builder, fmt.aprintf(" // {}", comment))
	}
	strings.write_string(builder, "\n")
}

// Generates an odin bitfield type from an <enums> element of type="bitmask"
gen_enums_bitfield :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	full_name := el_get_attrib(el, "name")
	flags, flag := trim_bitfield_typename(full_name)
	prefix, suffix := bitfield_name_to_prefix_suffix(full_name)

	strings.write_string(builder, fmt.aprintf("{} :: distinct bit_set[{}; Flags64]\n", flags, flag))
	strings.write_string(builder, fmt.aprintf("{} :: enum Flags64 {{\n", flag))

	for child in el.children {
		gen_enums_bitfield_value(builder, doc, doc.elements[child], prefix, suffix)
	}

	strings.write_string(builder, "}\n\n")
}

gen_enums_bitfield_value :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element, prefix, suffix: string) {
	if el.ident != "enum" {
		return
	}

	name := strings.trim_prefix(strings.trim_suffix(el_get_attrib(el, "name"), suffix), prefix)
	value := el_get_attrib(el, "bitpos")
	comment, has_comment := el_try_get_attrib(el, "comment")

	strings.write_string(builder, fmt.aprintf("\t{} = {},", name, value))
	if has_comment {
		strings.write_string(builder, fmt.aprintf(" // {}", comment))
	}
	strings.write_string(builder, "\n")
}

// Converts a full OpenXR enum type name to a prefix and suffix string to trim from its members
enum_name_to_prefix_suffix :: proc(name: string) -> (string, string) {
	// Handle weird cases
	if name == "XrStructureType" {return "XR_TYPE_", ""}
	if name == "XrResult" {return "XR_", ""}
	if name == "XrPerfSettingsNotificationLevelEXT" {return "XR_PERF_SETTINGS_NOTIF_LEVEL_", "_EXT"}

	// Determine if the type name has a known suffix
	suffix := ""
	for known in KNOWN_SUFFIXES {
		if !strings.has_suffix(name, known) {continue}
		suffix = known
	}

	// Now remove that suffix from the name and convert it to screaming snake case
	prefix := strings.trim_suffix(name, suffix)
	prefix = fmt.aprintf("{}_", strings.to_screaming_snake_case(prefix))
	suffix = fmt.aprintf("_{}", suffix)
	return prefix, suffix
}

// Converts a full OpenXR enum type name to a prefix and suffix string to trim from its members
trim_bitfield_typename :: proc(name: string) -> (string, string) {
	// Determine vendor suffix
	suffix := ""
	for known in KNOWN_SUFFIXES {
		if !strings.has_suffix(name, known) {continue}
		suffix = known
	}

	// Remove Vendor and "Bits" suffix, and Xr prefix
	name := strings.trim_suffix(strings.trim_suffix(name, suffix), "Bits")
	name = strings.trim_prefix(name, "Xr")

	// Build FooBarFlagsVENDOR and FooBarFlagVENDOR variants
	flags := fmt.aprintf("{}s{}", name, suffix)
	flag := fmt.aprintf("{}{}", name, suffix)
	return flags, flag
}

// Converts a full OpenXR enum type name to a prefix and suffix string to trim from its members
bitfield_name_to_prefix_suffix :: proc(name: string) -> (string, string) {
	// Determine if the type name has a known suffix
	suffix := ""
	for known in KNOWN_SUFFIXES {
		if !strings.has_suffix(name, known) {continue}
		suffix = known
	}

	// Now remove that suffix from the name, along with Bits and convert it to screaming snake case
	prefix := strings.trim_suffix(strings.trim_suffix(name, suffix), "FlagBits")
	prefix = fmt.aprintf("{}_", strings.to_screaming_snake_case(prefix))
	suffix = suffix == "" ? "_BIT" : fmt.aprintf("_BIT_{}", suffix)
	return prefix, suffix
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               STRUCTS.ODIN                                                              //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

OS_TYPES :: `
import "core:c"

// Vulkan Types
import vk "vendor:vulkan"

// OpenGL Types
EGLenum :: c.int

// Windows specific OS / API types
when ODIN_OS == .Windows {
	import win32 "core:sys/windows"
        HDC :: win32.HDC
        HGLRC :: win32.HGLRC
	LUID  :: win32.LUID
        IUnknown :: win32.IUnknown

        D3D_FEATURE_LEVEL :: c.int

        import D3D11 "vendor:directx/d3d11"
        ID3D11Device :: D3D11.IDevice
        ID3D11Texture2D :: D3D11.ITexture2D
        
        import D3D12 "vendor:directx/d3d12"
        ID3D12Device :: D3D12.IDevice
        ID3D12CommandQueue :: D3D12.ICommandQueue
        ID3D12Resource :: D3D12.IResource
} else {
        HDC :: distinct rawptr
        HGLRC :: distinct rawptr
	LUID   :: struct {
		LowPart:  DWORD,
		HighPart: LONG,
	}
        IUnknown :: distinct rawptr

        D3D_FEATURE_LEVEL :: c.int
        
        ID3D11Device :: distinct rawptr
        ID3D11Texture2D :: distinct rawptr
        
        ID3D12Device :: distinct rawptr
        ID3D12CommandQueue :: distinct rawptr
        ID3D12Resource :: distinct rawptr
}

`

// Mapping from C to odin type names
TYPE_ALIASES := map[string]string {
	"float"    = "f32",
	"double"   = "f64",
	"int8_t"   = "i8",
	"int16_t"  = "i16",
	"int32_t"  = "i32",
	"int64_t"  = "i64",
	"uint8_t"  = "u8",
	"uint16_t" = "u16",
	"uint32_t" = "u32",
	"uint64_t" = "u64",
	"XrBool32" = "b32",
	"int"      = "c.int",
	"char"     = "u8",
}

// Mapping from C to odin type names
NAME_ALIASES := map[string]string {
	"type"    = "sType",
	"context" = "ctx",
	"dynamic" = "fovDynamic",
}

UNSUPPORTED_STRUCTS :: [?]string{
	"XrGraphicsBindingOpenGLXlibKHR",
	"XrGraphicsBindingOpenGLXcbKHR",
	"XrGraphicsBindingOpenGLWaylandKHR",
	"XrGraphicsBindingOpenGLESAndroidKHR",
	"XrGraphicsBindingEGLMNDX",
}

// Generates the full enums.odin file and writes it out
gen_structs_odin :: proc(doc: ^xml.Document) {
	builder := strings.builder_make()
	strings.write_string(&builder, "package openxr\n\n")

	strings.write_string(&builder, OS_TYPES)

	for id in doc.elements[0].children {
		el := doc.elements[id]
		if el.ident != "types" {continue}
		gen_struct_types(&builder, doc, el)
	}

	os.write_entire_file("openxr/structs.odin", builder.buf[:])
}

gen_struct_types :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	for id in el.children {
		el := doc.elements[id]
		category, _ := el_try_get_attrib(el, "category")
		if category != "struct" {continue}
		gen_struct_type(builder, doc, el)
	}
}

gen_struct_type :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	full_name := el_get_attrib(el, "name")
	for unsupported in UNSUPPORTED_STRUCTS {
		if full_name == unsupported {return}
	}

	name := strings.trim_left(full_name, "Xr")

	strings.write_string(builder, fmt.aprintf("{} :: struct {{\n", name))

	for id in el.children {
		gen_struct_member(builder, doc, doc.elements[id])
	}

	strings.write_string(builder, "}\n\n")
}

gen_struct_member :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	if el.ident != "member" {return}

	type_str := doc.elements[el.children[0]].value
	name_str := doc.elements[el.children[1]].value

	// Apply alias and trim Xr prefix
	if type_str in TYPE_ALIASES {
		type_str = TYPE_ALIASES[type_str]
	}
	type_str = strings.trim_prefix(type_str, "Xr")
	if strings.has_prefix(type_str, "PFN_xr") {
		type_str = strings.trim_prefix(type_str, "PFN_xr")
		type_str = fmt.aprintf("Proc{}", type_str)
	}

	// Handle Vk prefixes
	if strings.has_prefix(type_str, "Vk") {
		type_str = strings.trim_prefix(type_str, "Vk")
		type_str = fmt.aprintf("vk.{}", type_str)
	}
	if strings.has_prefix(type_str, "PFN_vk") {
		type_str = strings.trim_prefix(type_str, "PFN_vk")
		type_str = fmt.aprintf("vk.Proc{}", type_str)
	}

	// This will have pointer / array characters
	ptr_count := strings.count(el.value, "*")
	if ptr_count == 1 {
		type_str = fmt.aprintf("^{}", type_str)
	}
	if ptr_count == 2 {
		type_str = fmt.aprintf("^^{}", type_str)
	}

	// Now handle void pointers
	if type_str == "^void" {
		type_str = "rawptr"
	}
	if type_str == "^^void" {
		type_str = "^rawptr"
	}

	// Alias reserved words
	if name_str in NAME_ALIASES {
		name_str = NAME_ALIASES[name_str]
	}

	strings.write_string(builder, fmt.aprintf("\t{} : {},\n", name_str, type_str))
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               PROCEDURES.ODIN                                                           //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Generates the full enums.odin file and writes it out
gen_procedures_odin :: proc(doc: ^xml.Document) {
	builder := strings.builder_make()
	strings.write_string(&builder, "package openxr\n\n")

	for id in doc.elements[0].children {
		el := doc.elements[id]
		if el.ident != "commands" {continue}
		gen_procedures(&builder, doc, el)
	}

	os.write_entire_file("openxr/procedures.odin", builder.buf[:])
}

gen_procedures :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	for id in el.children {
		el := doc.elements[id]
		if el.ident != "command" {continue}
		gen_procedure(builder, doc, el)
	}
}

gen_procedure :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
}

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

	builder := strings.builder_make()
	gen_file_start(&builder)

	// Handle top level elements
	for id in doc.elements[0].children {
		el := doc.elements[id]
		if el.ident == "enums" {
			gen_enums(&builder, doc, el)
		}
	}

	// Write the resulting file
	os.write_entire_file("openxr/xr.odin", builder.buf[:])
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

gen_file_start :: proc(builder: ^strings.Builder) {
	strings.write_string(builder, "package openxr\n\n")
	strings.write_string(builder, "import \"core:c\"\n\n")
	strings.write_string(builder, "Flags64 :: distinct u64\n\n")
}

// Generates odin code from an <enums> element
gen_enums :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	el_name := el_get_attrib(el, "name")

	// Handle API Constants special case
	if el_name == "API Constants" {
		gen_enums_constants(builder, doc, el)
		return
	}

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

// Generates odin constants from the "API Constants" <enums> element
gen_enums_constants :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	strings.write_string(builder, "// Constants\n\n")

	for child in el.children {
		gen_enums_constant(builder, doc, doc.elements[child])
	}
	strings.write_string(builder, "\n\n")
}

// Generate an odin constant from an <enum>
gen_enums_constant :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	full_name := el_get_attrib(el, "name")
	name := strings.trim_prefix(full_name, "XR_")
	value := el_get_attrib(el, "value")

	if name == "TRUE" || name == "FALSE" {
		return
	}

	strings.write_string(builder, fmt.aprintln(name, "::", value))
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

package openxr_odin

// The following changes were made to xr.xml to ensure encoding/xml could parse it.
// 1. Lines 2-4 inclusive were commented out
// 2. Elements with attribute values multiple lines (typically long descriptions) were collapsed onto single lines

import "core:encoding/xml"
import "core:fmt"
import "core:strings"
import "core:os"


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

gen_file_start :: proc(builder: ^strings.Builder) {
	strings.write_string(builder, "package openxr\n\n\n")
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

// Generate an odin constant from an <enum>
gen_enums_constant :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	full_name := el_get_attrib(el, "name")
	name := strings.trim_left(full_name, "XR_")
	value := el_get_attrib(el, "value")

	if name == "TRUE" || name == "FALSE" {
		return
	}

	strings.write_string(builder, fmt.aprintln(name, "::", value))
}

// Generates odin constants from the "API Constants" <enums> element
gen_enums_constants :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {
	strings.write_string(builder, "// Constants\n\n")

	for child in el.children {
		gen_enums_constant(builder, doc, doc.elements[child])
	}
}

// Generates an odin enum type from an <enums> element of type="enum"
gen_enums_enum :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {

}

// Generates an odin bitfield type from an <enums> element of type="bitmask"
gen_enums_bitfield :: proc(builder: ^strings.Builder, doc: ^xml.Document, el: xml.Element) {

}

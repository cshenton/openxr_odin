package openxr_odin

import "core:encoding/xml"
import "core:fmt"


main :: proc() {
	doc, err := xml.parse(#load("xr.xml"))
	if err != .None {
		fmt.println("Failed to Parse xr.xml, error", err)
		return
	}

        fmt.println(doc)
}

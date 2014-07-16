# CHANGELOG

### VERSION 0.0.1
* First Version

### VERSION 0.0.2
* ruby required version since 1.9.3 up to the edge version

### VERSION 0.0.3
* fixed gem dependency

### VERSION 0.0.4
* add files to gem spec, rake dependecy and version file

### VERSION 0.0.5
* fix gem dependencies and add travis to test every build

### VERSION 0.0.6
* test that strong colors palette return only code in the range
* add to palette a method to know the max number of colors in the palette

### VERSION 0.0.7
* add coveralls gem and require in test suite
* add custom palette method in order to allow ser you own range
* rgb ranges only can be read

### VERSION 0.1.0
* change gem behavior, know Palette class is the interface to access and use the gem
* Colorpicker::Palette.new know receives options template red_color_range
	green_color_branch and blue_color_range
======
* New methods in Palette
   * generate (interface to create a new palette base on templates or custom)
	   * :strong (a owner default palette with range of strong colors)
		 * :complete (the complete palette of hex colors 255*255*255)
	 * rgb_range (return the range )
	 * html (generate an html Warning! with large range of colors)
	 * __sample color__ (select a color of the range a return Color.new)
   * new (also can receive options to generate a palette)
======
* New methods in Color
   * new receive a code an string or and array
	 * to_rgb (convert and hex code to rgb representation return an array) 
	 * to_hex (convert and rgb code to hex code representation return an string)
	 * to_s (print color like hexadecimal string or rgb with css style)

 


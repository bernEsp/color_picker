Color Picker
============
[![Build Status](https://travis-ci.org/bernardogalindo/color_picker.svg?branch=master)](https://travis-ci.org/bernardogalindo/color_picker) 
[![Coverage Status](https://coveralls.io/repos/bernardogalindo/color_picker/badge.png?branch=master)](https://coveralls.io/r/bernardogalindo/color_picker?branch=master)
a tool to get a color based on color palette, also have a method to export to html all the color palette

-----------
### Example
* generate a complete palette
```ruby
  @palette= ColorPicker::Palette.new(template: :complete)
```
* then you have a complete range of colors
```ruby
 @palette.rgb
```
* You can get a sample color
```ruby
 @palette.sample_color
 > #<ColorPicker::Color:0x007f4dc236ac10 @hex_code="000000">
```
* generate a strong palette
```ruby
  @palette.generate(template: :strong)
  > [0..7, 0..9, 0..255]
```

#### Color
*initialize with string or array of rgb number
```ruby
  @color = ColorPicker::Color.new("000000")
``` 
* initialize with rgb array range
```ruby
  @color = ColorPicker::Color.new([255, 255,255])
```
*converters
```ruby
 @color.to_rgb
 @color.to_hex
```
*printers
```ruby
 @color.to_s
```


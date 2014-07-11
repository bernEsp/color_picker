module ColorPicker
  class Palette
    attr_reader :range, :range_html
    def initialize(palette_type="complete_palette")
      @range, @blue_color_range, @green_color_range, @red_color_range = []
      @range_html = ""
      eval "#{palette_type}"
    end

    def type=(type)
      eval "#{type}" 
    end

    def complete_palette
      @blue_color_range = ("0".."9").to_a + ("A".."F").to_a
      @green_color_range = ("0".."9").to_a + ("A".."F").to_a
      @red_color_range = ("0".."9").to_a + ("A".."F").to_a
      generate_palette
    end

    def strong_colors
      @green_color_range = ("0".. "9").to_a
      @red_color_range = ("0" .. "7").to_a
      @blue_color_range = ("0" .. "9").to_a + ("A" .. "F").to_a
      generate_palette
    end

    def to_html
      @range_html = "<div style='width='600px'; height='auto'; float='left'; clear='both'>"
      code = ""
      red = ((@red_color_range.first*2).to_i(16) .. (@red_color_range*2).to_i(16)).map do |red_range|
        red_range.to_s(16)
      end
      
      green = ((@green_color_range.first*2).to_i(16) .. (@green_color_range.last*2).to_i(16)).map do |green_range|
        green_range.to_s(16)
      end
      
      blue = ((@blue_color_range.first*2).to_i(16) .. (@blue_color_range.last*2).to_i(16)).each do |blue_range|
        blue_range.to_s(16)
      end

      colors = red.product(green, blue)

      colors.each do |color|
        code = color.join
        color_container = "<div style='background= #{code}; border= 1px solid #000;'>&nbps;</div><div style='float: left'>#{code}</div>"
        @range_html += color_container
      end
      @range_html += "</div>"
    end

    def method_missing(m, *args, &block)
      puts "There's no color palette type #{m} here -- please select strong colors color palette"
    end

    private
      def generate_palette
        @range = [@red_color_range,@green_color_range,@blue_color_range]
      end

      def get_pair
        (@blue_color_range.first.to_i(16) ..@blue_color_range.last.to_i(16)).map do |n|
          n.to_s(16)
        end
      end
  
  end
end

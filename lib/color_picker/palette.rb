module ColorPicker
  class Palette
    attr_reader :range, :range_html, :max_number_of_colors
		attr_accessor :blue_color_range, :green_color_range, :red_color_range
    def initialize(palette_type="complete_palette")
      @range, @blue_color_range, @green_color_range, @red_color_range = []
      @range_html = ""
      eval "#{palette_type}"
    end

    def type=(type)
      eval "#{type}" 
    end

    def complete_palette
      @blue_color_range = 0 .. 255
      @green_color_range = 0 .. 255
      @red_color_range =  0 .. 255
      generate_palette
    end

    def strong_colors
      @green_color_range = 0 .. 9
      @red_color_range = 0 .. 7
      @blue_color_range = 0 .. 159
      generate_palette
    end

    def to_html
      @range_html = "<div style='width='600px'; height='auto'; float='left'; clear='both'>"
			
			max_number = (@red_color_range.end+1) * (@green_color_range.end+1) * (@blue_color_range.end+1)

      (0 .. max_number-1).each do |color_code|
        color_container = "<div style='background= #{color_code.to_s(16)}; border= 1px solid #000;'>&nbps;</div><div style='float= left'>#{color_code.to_s(16)}</div>"
        @range_html += color_container
      end
      @range_html += "</div>"
    end

    def method_missing(m, *args, &block)
      puts "There's no color palette type #{m} here -- please select strong colors color palette"
    end

    private
      def generate_palette
				max_colors
				@range = [@red_color_range,@green_color_range,@blue_color_range]
      end

			def max_colors
				red = (@red_color_range.end+1 * (16**3)).to_s(16).ljust(6, "0")
				green = (@green_color_range.end+1 * (16**2)).to_s(16).rjust(4, "0") 
				blue = (@blue_color_range.end+1 *16).to_s(16)
				@max_number_of_colors = red.to_i(16) + green.to_i(16) + blue.to_i(16)
			end

      def get_pair
				(@blue_color_range.begin.to_i(16) ..@blue_color_range.end.to_i(16)).map do |n|
          n.to_s(16)
        end
      end
  
  end
end

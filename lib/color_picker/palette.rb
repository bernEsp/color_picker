module ColorPicker
  class Palette
    attr_reader :range, :range_html, :max_number_of_colors
		attr_reader :blue_color_range, :green_color_range, :red_color_range
    def initialize(palette_type="complete_palette")
      @range, @blue_color_range, @green_color_range, @red_color_range = []
			@max_number_of_colors=0
      @range_html = ""
      eval "#{palette_type}"
    end

    def type=(type)
      eval "#{type}" 
    end

    def complete_palette
      @red_color_range =  0 .. 255
      @green_color_range = 0 .. 255
      @blue_color_range = 0 .. 255
      generate_palette
    end

    def strong_colors
      @red_color_range = 0 .. 7
      @green_color_range = 0 .. 9
      @blue_color_range = 0 .. 159
      generate_palette
    end

		def custom_palette(red, green, blue)
			@red_color_range = red
			@green_color_range = green
			@blue_color_range = blue
			generate_palette
		end

    def to_html
      @range_html = "<div style='width='600px'; height='auto'; float='left'; clear='both'>"
			
      (0 .. @max_number_of_colors).each do |color_code|
        color_container = "<div style='background= ##{color_code.to_s(16)}'; border= '1px solid #000;'>&nbps;</div><div style='float= left'>#{color_code.to_s(16)}</div>"
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
				@max_number_of_colors = (@red_color_range.end+1) * (@green_color_range.end+1) * (@blue_color_range.end+1)
			end
  
  end
end

module ColorPicker
  class Palette 
		#palette templates
		TEMPLATES = {
			complete: {template: :complete, red_color_range: 0..255, green_color_range: 0..255, blue_color_range: 0..255 }, 
			strong: {template: :strong, red_color_range: 0..7, green_color_range: 0..9, blue_color_range: 0..255},
			skeleton: {template: nil, red_color_range: 0..0, green_color_range: 0..0, blue_color_range: 0..0}
		}
		
    attr_reader :rgb_range, :max_number_of_colors, :template,
								:blue_color_range, :green_color_range, :red_color_range
		attr_accessor :blue_color_range, :green_color_range, :red_color_range, :template

    def initialize(options = {})
			default_options.merge(options).each_pair do |key, value|
				eval "@#{key}= value"
			end
		end

		def rgb_range
			@rgb_range = [red_color_range,green_color_range,blue_color_range]
		end
    
		def to_html
      html = "<div style='width='600px'; height='auto'; float='left'; clear='both'>"	
      (0 .. max_number_of_colors).each do |color_code|
        color_container = "<div style='background= ##{color_code.to_s(16)}'; border= '1px solid #000;'>&nbps;</div><div style='float= left'>#{color_code.to_s(16)}</div>"
        html += color_container
      end
      html += "</div>"
    end
		
		def generate(options={})
			opts(options).each_pair do |key, value|
				eval "self.#{key}=value"
			end
			rgb_range
		end
	
		def max_number_of_colors
			(red_color_range.end+1) * (green_color_range.end+1) * (blue_color_range.end+1)
		end

		def sample_color
			rgb_range.map do |range_color|
				range_color.to_a.sample.to_s(16).rjust(2, "0")
			end.join
		end

    def method_missing(m, *args, &block)
			"Colors and stars something wrong. Palette types available :complete and :strong via template option"
    end
		
		private :red_color_range=, :blue_color_range=, :green_color_range=, :template=

    private	
			def default_options
				TEMPLATES[:skeleton]
			end
		
			def opts(options={})
				case options[:template]
				when :strong
					TEMPLATES[:strong].merge(options)
				when :complete
					TEMPLATES[:complete].merge(options)
				else
					TEMPLATES[:skeleton].merge(options)
				end
			end 
  end
end

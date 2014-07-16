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
      opts(options).each_pair do |key, value|
        eval "@#{key}= value"
      end
    end

    def rgb_range
      @rgb_range = [red_color_range,green_color_range,blue_color_range]
    end
    
    def html
      html = "<div style='width:600px;height:auto;float:left;clear:both'>"  
      range = max_number_of_colors
      range = 0 if max_number_of_colors == 1
      (0 .. range).each do |color_code|
        color_container = "<div style='background:##{color_code.to_s(16).rjust(6, '0')};width:60px;height:60px;border:1px solid #000;'>&nbsp;</div><div style='float:left'>#{color_code.to_s(16).rjust(6, '0')}</div>"
        html += color_container
      end
      html += "</div>"
      to_html { html }
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
      ary_code = rgb_range.map do |range_color|
        range_color.to_a.sample.to_s(16).rjust(2, "0")
      end
      Color.new(ary_code.join)
    end

    def method_missing(m, *args, &block)
      "Colors and stars something wrong. Palette types available :complete and :strong via template option"
    end
    
    private :red_color_range=, :blue_color_range=, :green_color_range=, :template=

    private    
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

      def to_html
        "<!DOCTYPE HTML>
        
        <html>
        
        <head>
          <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
          <title>Palette Html</title>
        </head>
        
        <body>
          #{yield}
        </body>
        </html>
        "
      end
      
  end
end

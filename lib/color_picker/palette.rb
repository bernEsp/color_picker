module ColorPicker
  class Palette

    attr_accessor :template, :colors, :html

    def initialize(template: :default, colors: {})
      @template = template
      @colors   = TEMPLATES[template].merge(colors)
    end

    def ranges
      colors.values
    end

    def sample_color
      Color.new(ranges.map { |range| get_shade(range) })
    end

    def max_number_of_colors
      result = 1
      ranges.each{|range| result *= range.end}
      result
    end

    def html
      @html ||= to_html
    end

    private
      def get_shade(range)
        (range.to_a.sample * (SHADES[template] || 1)).round
      end

      def to_html
        _times = max_number_of_colors > 100 ? 100 : max_number_of_colors
        html_content = HTML[:header]
        html_content += "<head><table cellpadding='0' cellspacing='0' border='0' id='random_colors'><tbody><tr border-top:1px solid #fff; border-bottom:1px solid #fff>"
        new_tr = nil
        _times.times do |n|
          html_content += "<tr border-top:1px solid #fff; border-bottom:1px solid #fff>" if new_tr
          html_content += "<td style='background:#{sample_color.to_hex};color:#fff;width:55px;border-right:1px solid #fff;border-left:1px solid #fff;text-align:center;line-height:26px'>#{sample_color.to_hex}</td>"
          if (n+1) % 5 == 0
            html_content += "</tr>"
            new_tr = true
          else 
            new_tr = false
          end 
        end
        html_content += "</tbody></table>" + HTML[:footer]
        generate_file html_content
      end

      def generate_file(content)
        file = File.open("palette_#{template}.html", 'w')
        file.write content
        file.close
        file.path
      end
  end
end

module ColorPicker
  class Palette

    attr_accessor :template, :colors

    def initialize(template: :default, colors: {})
      @template = template
      @colors   = TEMPLATES[template].merge(colors)
    end

    def ranges
      colors.values
    end

    def sample_color
      Color.new(ranges.map { |range| range.to_a.sample })
    end
  end
end

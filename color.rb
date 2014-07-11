module ColorPicker
  require 'color_picker/palette'
  class Color
    attr_accessor :palette
    attr_reader :code
    
    def initialize
      @palette = Palette.new
      @code = ""
      generate
    end
    
    def code
      @code ||= generate
    end

    def generate
      @code = ""
      @palette.range.each_with_index do |range, index|
        @code += (1..2).collect{|i| range[rand(range.size)]}.join
      end
      @code
    end

    def palette_type(type)
      @palette = @palette.type = type 
    end


  end
end

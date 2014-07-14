module ColorPicker
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
        @code += range.to_a[rand(range.size)].to_s(16).rjust(2, '0') 
      end
      @code
    end

    def palette_type(type)
			palette.type = type 
    end


  end
end

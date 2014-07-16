module ColorPicker
  class Color
    attr_reader :hex_code, :rgb_code
    attr_accessor :hex_code, :rgb_code
    
    def initialize(code)
      @hex_code = code.to_str if code.respond_to?(:to_str)
      @rgb_code = code.to_ary unless @hex_code
    end

    def to_rgb
      return self.to_s unless @hex_code
      @hex_code.scan(/.{2}/).map{|color| color.to_i(16)}
    end

    def to_hex
      return self.to_s unless @rgb_code
      @rgb_code.map{|number| number.to_s(16)}.join.rjust(6, '0')
    end

    def to_s(type=nil)
      return "rgb(#{rgb_code.join(', ')})" if type == :rgb || !rgb_code.nil?
      "##{hex_code}"
    end

    private :rgb_code=, :hex_code=

  end
end

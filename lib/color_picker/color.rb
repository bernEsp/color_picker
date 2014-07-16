module ColorPicker
  class Color
    attr_accessor :code

    def initialize(code)
      @code = code
    end

    def to_rgb
      return code if rgb?
      code.scan(/.{2}/).map { |n| n.to_i(16) }
    end

    def to_hex
      return code if hex?
      code.map { |n| n.to_s(16) }.join.rjust(6, '0')
    end

    def hex?
      code.respond_to?(:to_str)
    end

    def rgb?
      code.respond_to?(:to_ary)
    end
  end
end

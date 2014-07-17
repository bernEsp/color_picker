module ColorPicker
  class Color
    attr_accessor :code

    def initialize(code)
      @code = code
    end

    def to_rgb
      return code if rgb?
      Color.new code.scan(/.{2}/).map { |n| n.to_i(16) }
    end

    def to_hex
      return code if hex?
      Color.new code.map { |n| n.to_s(16) }.join.rjust(6, '0')
    end

    def hex?
      code.respond_to?(:to_str)
    end

    def rgb?
      code.respond_to?(:to_ary)
    end

    def to_s
      send("to_s_#{type}")
    end

    private
      def type
        rgb? ? :rgb : :hex
      end

      def to_s_hex
        "##{self.to_hex}"
      end

      def to_s_rgb
        "rgb(#{self.to_rgb.join(', ')})"
      end
  end
end

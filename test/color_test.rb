require 'test_helper'

module ColorPicker
  class ColorTest < Minitest::Test
    def setup
      @hex_color = ColorPicker::Color.new("000000")
      @rgb_color = ColorPicker::Color.new([0,0,0])
    end

    def test_initialize_color
      assert_equal '000000', @hex_color.code
      assert_equal [0,0,0], @rgb_color.code
    end

    def test_to_rgb
      assert_kind_of Color, @hex_color.to_rgb
      assert_equal [0,0,0], @rgb_color.to_rgb
    end

    def test_to_hex
      assert_equal "000000", @hex_color.to_hex
      assert_kind_of Color, @rgb_color.to_hex
    end

    def test_method_chain
      assert_equal "000000", @rgb_color.to_hex.code
      assert_equal [0,0,0], @hex_color.to_rgb.code
    end

    def test_to_s
      assert_equal "rgb(0, 0, 0)", @rgb_color.to_s
      assert_equal "#000000", @hex_color.to_s
    end

    def test_rgb?
      assert_equal false, @hex_color.rgb?
      assert_equal  true, @rgb_color.rgb?
    end

    def test_hex?
      assert_equal true, @hex_color.hex?
      assert_equal false, @hex_color.rgb?
    end
  end
end

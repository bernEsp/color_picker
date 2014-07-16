require "test_helper"
module ColorPicker
	class ColorTest < Minitest::Test
		def setup
			@color = ColorPicker::Color.new("000000")
		end

		def test_initialize_color
			assert_equal "000000", @color.hex_code
		end

		def test_convert_to_rgb
			assert_equal [0,0,0], ColorPicker::Color.new([0,0,0]).rgb_code
		end

		def test_to_s_hexadecimal
			assert_equal "#000000", @color.to_s
		end

		def test_to_s_rgb
			assert_equal "rgb(0, 0, 0)", ColorPicker::Color.new([0,0,0]).to_s(:rgb)
		end

		def test_hex_to_rgb
			assert_equal [0,0,0], @color.to_rgb 
		end

		def test_rgb_to_hex
			assert_equal "000000", ColorPicker::Color.new([0,0,0]).to_hex
		end

	end
end

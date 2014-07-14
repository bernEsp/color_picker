require "test_helper"
module ColorPicker
	class ColorTest < Minitest::Test
		def setup
			@color = ColorPicker::Color.new
		end

		def test_generate
			assert_match /([0-9]|[a-fA-F]){5,6}/, @color.generate
		end

		def test_code
			pre_generate_code = @color.code
			assert_equal  pre_generate_code, @color.code
		end

		def test_complete_palette
			@color.palette_type("complete_palette")
			assert_equal [0..255, 0..255, 0..255], @color.palette.range
		end

		def test_strong_colors_palette
			@color.palette_type("strong_colors")
			assert_equal [0..7, 0..9, 0..159], @color.palette.range
		end

		def test_strong_colors_generate_color
			@color.palette_type("strong_colors")
			red = (@color.palette.range[0].end+1 * (16**3)).to_s(16).ljust(6, "0")
			green = (@color.palette.range[1].end+1 * (16**2)).to_s(16).rjust(4, "0") 
			blue = (@color.palette.range[2].end+1 *16).to_s(16)
			max_range = red.to_i(16) + green.to_i(16) + blue.to_i(16)
			colors = []
			10.times { colors << @color.generate }
			colors.each do |color|
				puts color
				assert_operator color.to_i(16), :<=, (max_range+1)
			end
			assert_equal @color.palette.max_number_of_colors, max_range
		end

		def test_method_missing
			assert_match "undefined_method", @color.palette_type("undefined_method")
		end
	end
end

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
			max_range = (@color.palette.red_color_range.end+1) * (@color.palette.green_color_range.end+1) * (@color.palette.blue_color_range.end+1)
			colors = []
			10.times { colors << @color.generate }
			colors.each do |color|
				assert_match (/[0-7]{2}[0-9]{2}[0-9|a-fA-F]{2}/), color
			end
			assert_equal @color.palette.max_number_of_colors, max_range
		end

		def test_method_missing
			assert_match "undefined_method", @color.palette_type("undefined_method")
		end
	end
end

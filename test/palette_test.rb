require "test_helper"
module ColorPicker
	class PaletteTest < Minitest::Test
		def setup
			@palette = ColorPicker::Palette.new
		end

		def test_complete_palette
			assert_equal [0..255, 0 .. 255, 0 .. 255], @palette.complete_palette
		end

		def test_strong_colors_palette
			assert_equal [0..7, 0 .. 9, 0 .. 159], @palette.strong_colors
		end
	end
end

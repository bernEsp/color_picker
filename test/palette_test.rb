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

		def test_to_html
			skip("need to work in algorith to itereate bigger numbers")
			@palette.custom_palette(0..1, 0..1, 0..1)
			assert_match (/<div style='width=600px;height='auto';float='left';clear='both'><div style='background='#010101'; border='1px solid #000'> <\/div>
										 <div style='float=left'>010101<\/div><\/div>/), @palette.to_html 
		end

		def test_custom_palete
			assert_equal [0..1, 0..1, 0..1], @palette.custom_palette(0..1, 0..1, 0..1)
		end
	end
end

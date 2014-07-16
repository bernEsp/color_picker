require "test_helper"
module ColorPicker
	class PaletteTest < Minitest::Test
		def setup
			@palette = ColorPicker::Palette.new
		end

		def test_initialize_complete_range
			assert_equal [0..0, 0..0, 0..0], @palette.rgb_range
		end

		def test_initialize_complete_palette_template
			assert_equal nil, @palette.template
		end

		def test_complete_palette
			assert_equal [0..255, 0 .. 255, 0 .. 255], @palette.generate(template: :complete)
		end

		def test_strong_paletter
			assert_equal [0..7, 0 .. 9, 0..255], @palette.generate(template: :strong)
		end

		def test_to_html
			skip("need to work in algorith to itereate bigger numbers")
			@palette.custom_palette(0..1, 0..1, 0..1)
			assert_match (/<div style='width=600px;height='auto';float='left';clear='both'><div style='background='#010101'; border='1px solid #000'> <\/div>
										 <div style='float=left'>010101<\/div><\/div>/), @palette.to_html 
		end

		def test_generate_custom_palette
			assert_equal [0..1, 0..1, 0..1], @palette.generate(template: :custom, red_color_range: 0..1, green_color_range: 0..1, blue_color_range: 0..1)
		end

		def test_sample_color
			assert_match /([0-9]|[a-fA-F]){5,6}/, @palette.sample_color
		end

		def test_strong_colors_palette_range
			@palette.generate(type: :strong)
			max_range = (@palette.red_color_range.end+1) * (@palette.green_color_range.end+1) * (@palette.blue_color_range.end+1)
			colors = []
			10.times { colors << @palette.sample_color }
			colors.each do |color|
				assert_match (/[0-7]{2}[0-9]{2}[0-9|a-fA-F]{2}/), color
			end
			assert_equal @palette.max_number_of_colors, max_range
		end

		def test_method_missing
			assert_match "Colors and stars something wrong. Palette types available :complete and :strong via template option", @palette.undefined
		end
	end
end

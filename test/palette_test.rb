require 'test_helper'

module ColorPicker
  class PaletteTest < Minitest::Test
    def setup
      @palette = ColorPicker::Palette.new
      @strong_palette = ColorPicker::Palette.new(template: :strong)
    end

    def test_default_palette
      assert_equal :default, @palette.template
      assert_equal ({ red: 0..255, green: 0..255, blue: 0..255 }), @palette.colors
    end

    def test_strong_palette
      assert_equal :strong, @strong_palette.template
      assert_equal ({ red: 0..7, green: 0..9, blue: 0..255 }), @strong_palette.colors
    end

    def test_custom_palette
      @custom_palette = ColorPicker::Palette.new(colors: { red: 5..10, green: 15..20, blue: 25..30 })
      assert_equal :default, @custom_palette.template
      assert_equal ({ red: 5..10, green: 15..20, blue: 25..30 }), @custom_palette.colors
    end

    def test_sample_color
      assert_kind_of Color, @palette.sample_color
    end
  end
end

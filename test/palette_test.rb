require 'test_helper'

module ColorPicker
  class PaletteTest < Minitest::Test
    def setup
      @palette = ColorPicker::Palette.new
      @dark_palette = ColorPicker::Palette.new(template: :dark)
      @dark_hsl = ColorPicker::Palette.new(template: :dark_hsl)
    end

    def test_default_palette
      assert_equal :default, @palette.template
      assert_equal ({ red: 0..255, green: 0..255, blue: 0..255 }), @palette.colors
    end

    def test_dark_palette
      assert_equal :dark, @dark_palette.template
      assert_equal ({ red: 0..76, green: 0..94, blue: 0..255 }), @dark_palette.colors
    end

    def test_custom_palette
      @custom_palette = ColorPicker::Palette.new(colors: { red: 5..10, green: 15..20, blue: 25..30 })
      assert_equal :default, @custom_palette.template
      assert_equal ({ red: 5..10, green: 15..20, blue: 25..30 }), @custom_palette.colors
    end

    def test_sample_color
      assert_kind_of Color, @palette.sample_color
    end

    def test_html
      @custom_palette = ColorPicker::Palette.new(colors: { red: 0..1, green: 1..2, blue: 5..14 })
      assert_equal "palette_default.html", @palette.html
    end

    def test_dark_hsl
      assert_equal :dark_hsl, @dark_hsl.template
      assert_equal ({ h: 0..360, s: 100..100, l: 50..50 }), @dark_hsl.colors
    end
  end
end

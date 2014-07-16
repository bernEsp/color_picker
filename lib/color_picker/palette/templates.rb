module ColorPicker
  class Palette
    TEMPLATES = {
      default: { red: 0..255, green: 0..255, blue: 0..255 },
      strong:  { red: 0..7, green: 0..9, blue: 0..255}
    }
  end
end

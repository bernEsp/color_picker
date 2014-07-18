module ColorPicker
  class Palette
    TEMPLATES = {
      default: { red: 0..255, green: 0..255, blue: 0..255 },
      dark:  { red: 0..76, green: 0..94, blue: 0..255},
      dark_hsl: { h: 0..360, s: 100..100, l: 50..50 }
    }
    SHADES = {
    	dark: 0.6
    }
    HTML = {
    	header: '<!DOCTYPE HTML><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/><title>Palete</title><body>',
    	footer: '</body></html>'
    }
  end
end

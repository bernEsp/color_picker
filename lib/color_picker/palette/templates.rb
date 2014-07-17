module ColorPicker
  class Palette
    TEMPLATES = {
      default: { red: 0..255, green: 0..255, blue: 0..255 },
      dark:  { red: 0..76, green: 0..94, blue: 0..255}
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

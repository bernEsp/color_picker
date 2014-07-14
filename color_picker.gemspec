Gem::Specification.new do |s|
	s.name				= "color_picker"
	s.version			= "0.0.1"
	s.date				= "2014-07-13"
	s.summary			= "A gem to genenerate a random color"
	s.description = "a tool to get a color based on color palette, also have a method to export to html all the color palette"
	s.authors			= ["Bernardo Galindo"]
	s.email				= "bernardo466@gmail.com"
	s.files				= ["lib/color_picker.rb"]
	s.homepage		= "http://github.com/bernardogalindo/color_picker"
	s.license			= "MIT"

	s.test_files	= s.files.grep(%r{^(test|spec|features)/})
	s.require_paths = ['lib']
	s.required_ruby_version = '>= 1.9.3'

	s.add_development_dependency "minitest"	
end

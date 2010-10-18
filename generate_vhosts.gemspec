Gem::Specification.new do |s|
  s.name              = "generate_vhosts"
  s.version           = "0.1.0"
  s.summary           = "Generate vhosts for all rack apps in a given directory"
  s.author            = "Matt House"
  s.email             = "matt@eightbitraptor.com"
  s.homepage          = "http://eightbitraptor.com"

  s.has_rdoc          = false

  s.files             = Dir.glob("{lib}/**/*")
  s.executables       = ["generate_vhosts"]
  s.require_paths     = ["lib"]
end

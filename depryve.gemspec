Gem::Specification.new do |gem|
  gem.name = "depryve"
  gem.version = File.read(File.expand_path("../VERSION", __FILE__)).strip

  gem.author = "Vinny Diehl"
  gem.email = "vinny.diehl@gmail.com"
  gem.homepage = "https://github.com/vinnydiehl/depryve"

  gem.license = "MIT"

  gem.summary = "Remove the IRB/Pry prompt and output when copying code"
  gem.description = "Hassle-free copy/pasting of Ruby console output."

  gem.bindir = "bin"
  gem.executables = %w[depryve]
  gem.require_paths = %w[lib]
  gem.test_files = Dir["spec/**/*"]
  gem.files = `git ls-files -z`.split "\x0"

  gem.required_ruby_version = ">= 2.0"

  gem.add_dependency "clipboard", "~> 1.3"
  gem.add_development_dependency "rake", "~> 13.0"
  gem.add_development_dependency "rspec", "~> 3.12"
  gem.add_development_dependency "fuubar", "~> 2.5"
end

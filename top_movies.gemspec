
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "top_movies/version"

Gem::Specification.new do |spec|
  spec.name          = "top_movies"
  spec.version       = TopMovies::VERSION
  spec.authors       = "ayesha ansari"
  spec.email         = "ayesha.x.ansari@gmail.com"

  spec.summary       = "Top Movies"
  spec.description   = "List Top Movies provide details related to the top movie selected"
  # Tried to install gem and then push didnt work will try again
  spec.homepage      = "http://rubygems.org/gems/top_movies"
  spec.license       = "MIT"
  spec.files         = ["lib/top_movies.rb", "lib/top_movies/cli.rb", "lib/top_movies/scraper.rb", "lib/top_movies/movies.rb"]
 # spec.bindir        = "exe"
  spec.executables  << "top-movies"
  spec.require_paths = ["lib", "lib/top_movies"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end

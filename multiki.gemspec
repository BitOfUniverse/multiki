
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "multiki/version"

Gem::Specification.new do |spec|
  spec.name          = "multiki"
  spec.version       = Multiki::VERSION
  spec.authors       = ["Alexey Nikolaev"]
  spec.email         = ["bitofuniverse@gmail.com"]

  spec.summary       = %q{Run multiple IO-bound tasks simulatenusly within each/map block}
  spec.description   = %q{Class allow treating asynchronous tasks as synchronous ones but with random order}
  spec.homepage      = "http://github.com/bitofuniverse/multiki"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'epic_hash_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = 'epic_hash_cleaner'
  spec.version       = EpicHashCleaner::VERSION
  spec.authors       = ['fsainz']
  spec.email         = ['fernando.sainz@i22.de']

  spec.summary       = 'Removes recursively nil and empty elements from a hash'
  spec.homepage      = 'https://github.com/i22-digitalagentur/epic-hash-cleaner'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'm'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop', '0.52.1'
  spec.add_development_dependency 'simplecov'
end

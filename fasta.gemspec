lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fasta/version'

Gem::Specification.new do |spec|
  spec.name          = 'fasta'
  spec.version       = Fasta::VERSION
  spec.authors       = ['Yaro']
  spec.email         = ['osyaroslav@gmail.com']

  spec.summary       = 'Fasta is a mini web framework'
  spec.description   = 'Rack Server API'
  spec.homepage      = 'http://github.com/vergilet/fasta'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "#: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.files        += Dir['tasks/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hanami-router', '~> 2.0.0.alpha3'
  spec.add_dependency 'logger', '~> 1'
  spec.add_dependency 'oj', '~> 3'
  spec.add_dependency 'pg', '~> 1'
  spec.add_dependency 'rack', '~> 2'
  spec.add_dependency 'sequel', '~> 5'
  spec.add_dependency 'thor', '~> 1'

  spec.add_dependency 'puma', '>= 4', '< 6'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

# frozen_string_literal: true

require_relative 'lib/inss_calculator/version'

Gem::Specification.new do |spec|
  spec.name = 'inss_calculator'
  spec.version = InssCalculator::VERSION
  spec.authors = ['Paulo Felipe Souza']
  spec.email = ['alparakleto@gmail.com']

  spec.summary = 'Calculadora de desconto do INSS'
  spec.description = 'Calcula o valor a descontar de acordo com a faixa salarial. Os novos valores corrente em 2024.'
  spec.homepage = 'https://github.com/Pauloparakleto/inss_calculator'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Pauloparakleto/inss_calculator'
  spec.metadata['changelog_uri'] = 'https://github.com/Pauloparakleto/inss_calculator/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

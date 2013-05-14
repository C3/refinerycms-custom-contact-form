# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-custom-contact-form'
  s.version           = '1.0'
  s.description       = 'Custom contact form generater for Refinery CMS'
  s.date              = '2013-05-01'
  s.summary           = 'Custom contact form extension for Refinery CMS. Lets you define the form fileds you want and builds them into a working contact form.'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = ['Kate Deutscher']
  s.license           = %q{MIT}
  s.homepage          = %q{https://github.com/C3/refinerycms-custom-contact-form}

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.8'
  s.add_dependency             'refinerycms-settings', '~> 2.0.1'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.8'
end

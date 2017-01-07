# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_fcontact_us'
  s.version     = '3.0.7'
  s.summary     = 'Reworked the contact_us gem to add a basic contact us form to Spree.'
  s.description = 'Reworked the contact_us gem to add a basic contact us form to Spree.'
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'chandana'
   s.email     = 'chandana@sproutssolutions.com'
   s.homepage  = 'http://www.spreecommerce.com'
  s.license = 'BSD-3'

  # s.files       = `git ls-files`.split("\n")
  # s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.7'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'generator_spec',   '~> 0.8'
  s.add_development_dependency 'rspec-rails', '~> 2.13'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'shoulda-matchers', '~> 2.0'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end

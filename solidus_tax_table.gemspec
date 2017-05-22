# encoding: UTF-8

$:.push File.expand_path('../lib', __FILE__)
require 'solidus_tax_table/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_tax_table'
  s.version     = SolidusTaxTable::VERSION
  s.summary     = 'Taxes on the cheap'
  s.description = 'Solidus extension to load taxes from a CSV into memory'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Chris Todorov'
  s.email     = 'chris@stembolt.com'
  s.homepage  = 'https://github.com/forkata/solidus_tax_table'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  solidus_version = [">= 1.0.6", "< 3"]
  s.add_dependency 'solidus_core', solidus_version

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end

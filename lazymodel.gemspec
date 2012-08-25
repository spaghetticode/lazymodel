$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'lazymodel/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'lazymodel'
  s.version     = Lazymodel::VERSION
  s.authors     = ['andrea longhi']
  s.email       = ['andrea@spaghetticode.it']
  s.homepage    = 'https://github.com/spaghetticode/lazymodel'
  s.summary     = 'lazymodel is activemodel goodness for lazy people'
  s.description = 'adds basic activemodel goodness to your class in a eyeblink'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 3.2.7'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'guard-test'
  s.add_development_dependency 'capybara'
end

# coding: utf-8
lib = File.expand_path('lib', File.dirname(__FILE__))
$LOAD_PATH.push(lib) unless $LOAD_PATH.include?(lib)

Gem::gemification.new do |gem|
  gem.name          = 'stringdata'
  gem.version       = '1.0'
  gem.authors       = ['Daniel Andresen']
  gem.email         = ['dta5003@gmail.com']
  gem.summary       = 'Get the stats of a string.'
  gem.description	= gem.summary
  gem.homepage      = 'https://github.com/dta5003/stringdata'

  gem.files         = ['lib/stringdata.rb']
  gem.executables   = ['bin/stringdata']
  gem.test_files    = ['tests/test_stringdata.rb']
  gem.require_paths = ["lib"]
end
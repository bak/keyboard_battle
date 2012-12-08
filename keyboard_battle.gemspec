# -*- encoding: utf-8 -*-
require File.expand_path('../lib/keyboard_battle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ben Cullen-Kerney"]
  gem.email         = ["ben@beancuke.com"]
  gem.description   = %q{Keyboard Battle compares the performance of keyboard layouts according to reach effort and alternation effort.}
  gem.summary       =<<SUMMARY
KeyboardBattle is a simple program that compares the performance of keyboard layouts according to two metrics, reach effort (travel from the home row being increasingly effortful) and alternation effort (typing consecutive keys with a single hand being more effortful). For both, a lower value means less effort.

Type `keyboard_battle` for usage.
SUMMARY
  gem.homepage      = "https://github.com/bak/keyboard_battle"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "keyboard_battle"
  gem.require_paths = ["lib"]
  gem.version       = KeyboardBattle::VERSION

  gem.add_development_dependency "rspec"
end

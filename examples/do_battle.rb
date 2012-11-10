#!/usr/bin/env ruby -w

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'keyboard_battle'

Dir.glob('texts/*.*') do |filename|
  kb = KeyboardBattle.new(filename)
  print kb.to_s
end

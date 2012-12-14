require 'spec_helper'

describe KeyboardBattle::CommandDispatcher do

  describe 'an instance with file args' do
    it 'runs the specified files' do
      KeyboardBattle::CommandDispatcher.any_instance.should_receive(:run).with(["texts/qbf.txt"])
      KeyboardBattle::CommandDispatcher.new(["texts/qbf.txt"])
    end
  end

  describe 'an instance with --bundled' do
    it 'runs all bundled files' do
      KeyboardBattle::CommandDispatcher.any_instance.should_receive(:run).with(Dir.glob("#{File.expand_path('../../..', __FILE__)}/texts/*.txt"))
      KeyboardBattle::CommandDispatcher.new(["--bundled"])
    end
  end

  describe 'an instance without args' do
    it 'prints the help' do
      KeyboardBattle::CommandDispatcher.any_instance.should_receive(:help)
      KeyboardBattle::CommandDispatcher.new([])
    end
  end
end

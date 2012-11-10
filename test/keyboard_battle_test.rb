#!/usr/bin/env ruby -w

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'keyboard_battle'
require 'rubygems'
require 'minitest/autorun'

describe KeyboardBattle do
  describe "with an easy one" do
    before do
      @kb = KeyboardBattle.new('texts/qbf.txt')
    end

    describe "when loading keyboards" do
      it "loads qwerty" do
        @kb.keyboards.map {|k| k.name}.must_include 'qwerty'
      end

      it "loads dvorak" do
        @kb.keyboards.map {|k| k.name}.must_include 'dvorak'
      end
    end

    describe "when processing texts" do
      describe "with qwerty" do
        it "reports reach effort" do
          @kb.results[:qwerty][:reach_effort].must_equal 30
        end

        it "reports alternation effort" do
          @kb.results[:qwerty][:alternation_effort].must_equal 11
        end

        it "reports raw score" do
          @kb.results[:qwerty][:raw_score].must_equal 41
        end
      end

      describe "with dvorak" do
        it "reports reach effort" do
          @kb.results[:dvorak][:reach_effort].must_equal 21
        end

        it "reports alternation effort" do
          @kb.results[:dvorak][:alternation_effort].must_equal 13
        end

        it "reports raw score" do
          @kb.results[:dvorak][:raw_score].must_equal 34
        end
      end

      describe "with colemak" do
        it "reports reach effort" do
          @kb.results[:colemak][:reach_effort].must_equal 22
        end

        it "reports alternation effort" do
          @kb.results[:colemak][:alternation_effort].must_equal 9
        end

        it "reports raw score" do
          @kb.results[:colemak][:raw_score].must_equal 31
        end
      end

      it "should have an informative to_s" do
        [
          /qbf(.*)qwerty(.*)reach(.*)30/m,
          /qbf(.*)dvorak(.*)reach(.*)21/m,
          /qbf(.*)colemak(.*)reach(.*)22/m,
          /qbf(.*)qwerty(.*)alternation(.*)11/m,
          /qbf(.*)dvorak(.*)alternation(.*)13/m,
          /qbf(.*)colemak(.*)alternation(.*)9/m,
          /qbf(.*)qwerty(.*)raw(.*)41/m,
          /qbf(.*)dvorak(.*)raw(.*)34/m,
          /qbf(.*)colemak(.*)raw(.*)31/m
        ].each { |m|
          @kb.to_s.must_match m
        }
      end
    end
  end
end

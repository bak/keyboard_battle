require 'spec_helper'

describe KeyboardBattle::Report do

  describe 'an instance' do
    let(:battle) { 
      KeyboardBattle::Report.new('foo.txt', { dvorak: { a: 1, b: 2, c: 3 }}) 
    }

    it "should have an informative to_s" do
      [
        /foo(.*)dvorak(.*)a(.*)1/m,
        /foo(.*)dvorak(.*)b(.*)2/m,
        /foo(.*)dvorak(.*)c(.*)3/m,
      ].each { |m|
        battle.to_s.should match(m)
      }
    end
  end
end

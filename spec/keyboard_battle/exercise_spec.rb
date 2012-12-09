require 'spec_helper'

describe KeyboardBattle::Exercise do
  
  describe 'an instance' do
    let(:exercise) { KeyboardBattle::Exercise.new('texts/qbf.txt', KeyboardBattle::Keyboard.all) }

    it "loads the keyboards" do
      expect(exercise.send(:keyboards).map {|k| k::NAME}).to eq(%w(qwerty dvorak colemak))
    end

    describe "when processing texts" do
      describe "with qwerty" do
        it "calculates reach effort" do
          expect(exercise.results[:qwerty][:reach_effort]).to eq(30)
        end

        it "calculates alternation effort" do
          expect(exercise.results[:qwerty][:alternation_effort]).to eq(11)
        end

        it "calculates raw score" do
          expect(exercise.results[:qwerty][:raw_score]).to eq(41)
        end
      end

      describe "with dvorak" do
        it "calculates reach effort" do
          expect(exercise.results[:dvorak][:reach_effort]).to eq(21)
        end

        it "calculates alternation effort" do
          expect(exercise.results[:dvorak][:alternation_effort]).to eq(13)
        end

        it "calculates raw score" do
          expect(exercise.results[:dvorak][:raw_score]).to eq(34)
        end
      end

      describe "with colemak" do
        it "calculates reach effort" do
          expect(exercise.results[:colemak][:reach_effort]).to eq(22)
        end

        it "calculates alternation effort" do
          expect(exercise.results[:colemak][:alternation_effort]).to eq(9)
        end

        it "calculates raw score" do
          expect(exercise.results[:colemak][:raw_score]).to eq(31)
        end
      end
    end
  end
end

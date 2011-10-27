#!/usr/bin/env ruby -w

class File
  def self.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close()
  end
end

class Keyboard
  attr_accessor :left, :right, :name

  def combined
    left + right
  end
end

class KeyboardBattle

  # KeyboardBattle tests a passage of text for reach effort
  # expended (zero for home row, increasing for reach), and
  # hand alternation effort. In both values, lower is better.

  attr_accessor :filename, :keyboards, :results

  EFFORT_L = %w(3 2 2 2 2 2 2 1 1 1 1 1 0 0 0 0 1 1 1 1 1 2 3 2 2 2 2 2 2 1 1 1 1 1 0 0 0 0 1 1 1 1 1 2).collect { |el| el.to_i }
  EFFORT_R = %w(2 2 2 2 2 2 1 1 1 1 1 1 2 3 1 0 0 0 0 1 1 1 1 1 1 2 2 2 2 2 2 1 1 1 1 1 1 2 3 1 0 0 0 0 1 1 1 1 1 1).collect { |el| el.to_i }
  EFFORT_C = EFFORT_L + EFFORT_R

  def initialize(filename)
    @filename = filename
    @keyboards = load_keyboards
    @results = { }

    process
  end

  def to_s
    out = "#{@filename}:\n"
    @results.each do |keyboard,performance|
      out += "  #{keyboard}:\n"
      performance.each do |metric, result|
        out += "    #{metric}: #{result}\n"
      end
    end
    out
  end

  private

  def load_keyboards
    ks = [ ]
    Dir.glob(File.join('lib','keyboards','*.txt')) { |filename|
      n = File.basename(filename, '.txt')
      k = Keyboard.new
      File.open_and_process(filename,'r') { |file|
        l = eval(file.gets)
        r = eval(file.gets)
        k.left = l
        k.right = r
        k.name = n
        ks << k
      }
    }
    ks
  end

  def process
    @keyboards.each do |keyboard|
      # set up container vars
      prev_hand = nil
      alternation_effort = 0
      reach_effort = 0

      File.open_and_process(@filename,'r') do |file|
        while line = file.gets
          line.each_char do |char|
            if keyboard.combined.include?(char)

              # measure alternation efficiency
              hand = keyboard.left.include?(char) ? 'l' : 'r'
              if prev_hand
                alternation_effort += (hand == prev_hand) ? 1 : 0
              end
              prev_hand = hand

              # measure reach efficiency
              reach_effort += KeyboardBattle::EFFORT_C[keyboard.combined.find_index(char)]
            end
          end
        end
      end

      @results[keyboard.name.to_sym] = {
        :alternation_effort => alternation_effort,
        :reach_effort => reach_effort,
        :raw_score => (alternation_effort + reach_effort)
      }
    end
    @results
  end
end

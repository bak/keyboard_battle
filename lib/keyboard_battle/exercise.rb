module KeyboardBattle
  class Exercise

    attr_accessor :results, :filename, :keyboards

    def initialize(f, k)
      @filename  = f
      @keyboards = k
      @results   = run
    end

    private

    # tests a passage of text for reach effort expended (zero for home row, 
    # increasing for reach), and hand alternation effort. In both values,
    # lower is better.
    def run
      results = { }
      keyboards.each do |keyboard|
        # set up container vars
        prev_hand = nil
        alternation_effort = 0
        reach_effort = 0
        open_and_process(filename,'r') do |file|
          while line = file.gets
            line.each_char do |char|
              if effort = keyboard::MAP[char]

                # measure alternation efficiency
                hand = keyboard::LEFT_KEYS.include?(char) ? 'l' : 'r'
                if prev_hand
                  alternation_effort += (hand == prev_hand) ? 1 : 0
                end
                prev_hand = hand

                # measure reach efficiency
                reach_effort += effort
              end

            end
          end
        end

        results[keyboard::NAME.to_sym] = {
          :alternation_effort => alternation_effort,
          :reach_effort => reach_effort,
          :raw_score => (alternation_effort + reach_effort)
        }
      end
      results
    end

    def open_and_process(*args)
      f = File.open(*args)
      yield f
      f.close()
    end

  end
end

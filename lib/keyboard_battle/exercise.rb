module KeyboardBattle
  class Exercise

    attr_accessor :results, :filename

    def initialize(filename, keyboards)
      @filename  = filename
      @keyboards = keyboards
      @results   = run
    end

    private

    attr_accessor :keyboards

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
              if keyboard.combined.include?(char)

                # measure alternation efficiency
                hand = keyboard.left.include?(char) ? 'l' : 'r'
                if prev_hand
                  alternation_effort += (hand == prev_hand) ? 1 : 0
                end
                prev_hand = hand

                # measure reach efficiency
                reach_effort += EFFORT[keyboard.combined.find_index(char)]
              end
            end
          end
        end

        results[keyboard.name.to_sym] = {
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

    EFFORT = ( # left hand + right hand effort values
      %w(3 2 2 2 2 2 2 1 1 1 1 1 0 0 0 0 1 1 1 1 1 2 3 2 2 2 2 2 2 1 1 1 1 1 0 0 0 0 1 1 1 1 1 2) +
      %w(2 2 2 2 2 2 1 1 1 1 1 1 2 3 1 0 0 0 0 1 1 1 1 1 1 2 2 2 2 2 2 1 1 1 1 1 1 2 3 1 0 0 0 0 1 1 1 1 1 1)
    ).collect { |el| el.to_i }

  end
end

module KeyboardBattle
  class Report

    def initialize(filename, results)
      @filename = filename
      @results = results
    end

    def to_s
      out = "\n"
      out << "#{@filename}:\n"
      @results.each do |keyboard, performance|
        out << "  #{keyboard}:\n"
        performance.each do |metric, result|
          out << "    #{metric}: #{result}\n"
        end
      end
      out << "\n"
    end

  end
end

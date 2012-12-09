module KeyboardBattle
  class CommandDispatcher

    def initialize(args)

      if opt = args.first
        case opt
        when '--bundled'
          self.run(Dir.glob("#{File.expand_path('../../..', __FILE__)}/texts/*.txt"))
        else
          self.run(args)
        end
      else
        help
      end
    end

    def run(filenames)
      filenames.each do |filename|
        exercise = KeyboardBattle::Exercise.new(filename, keyboards)
        print report(exercise)
      end
    end

    def help
      print <<HELP

What text(s) would you like to battle upon?
You can specify file(s) to exercise, e.g.:

    $ keyboard_battle mytext1.txt mytext2.txt

Or, use --bundled to try it out with a few bundled texts:

    $ keyboard_battle --bundled

HELP
    end

    def report(exercise)
      KeyboardBattle::Report.new(exercise.filename, exercise.results).to_s
    end

    def keyboards
      KeyboardBattle::Keyboard.all
    end
  end
end

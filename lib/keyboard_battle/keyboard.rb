module KeyboardBattle
  class Keyboard

    class Qwerty < self
      def name
        "qwerty"
      end

      def left
        %w(` 1 2 3 4 5 6 q w e r t a s  d f g z x c v b ~ ! @ # $ % ^ Q W E R T A S D F G Z X C V B)
      end

      def right
        %w(7 8 9 0 - = y u i o p [ ] \\ h j k l ; ' n m , . / & * ( ) _ + Y U I O P { } | H J K L : " N M < > ?)
      end
    end

    class Dvorak < self
      def name
        "dvorak"
      end

      def left
        %w(` 1 2 3 4 5 6 ' , . p y a o  e u i ; q j k x ~ ! @ # $ % ^ " < > P Y A O E U I : Q J K X)
      end

      def right
        %w(7 8 9 0 [ ] f g c r l / = \\ d h t n s - b m w v z & * ( ) { } F G C R L ? + | D H T N S _ B M W V Z)
      end
    end

    class Colemak < self
      def name
        "colemak"
      end

      def left
        %w(` 1 2 3 4 5 6 q w f p g a r  s t d z x c v b ~ ! @ # $ % ^ Q W F P G A R S T D Z X C V B)
      end

      def right
        %w(7 8 9 0 - = j l u y : [ ] \\ h n e i o ' k m , . / & * ( ) _ + J L U Y ; { } | H N E I O " K M < > ?)
      end
    end

    attr_accessor :left, :right, :name

    def combined
      left + right
    end

    def self.all
      [ 
        KeyboardBattle::Keyboard::Qwerty.new,
        KeyboardBattle::Keyboard::Dvorak.new,
        KeyboardBattle::Keyboard::Colemak.new
      ]
    end
  end
end

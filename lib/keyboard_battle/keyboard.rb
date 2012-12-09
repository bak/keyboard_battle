module KeyboardBattle
  class Keyboard

    class << self

      def all
        [ 
          KeyboardBattle::Keyboard::Qwerty,
          KeyboardBattle::Keyboard::Dvorak,
          KeyboardBattle::Keyboard::Colemak
        ]
      end

    end

    LEFT_EFFORT = %w(3 2 2 2 2 2 2 1 1 1 1 1 0 0 0 0 1 1 1 1 1 2 3 2 2 2 2 2 2 1 1 1 1 1 0 0 0 0 1 1 1 1 1 2).collect { |el| el.to_i }
    RIGHT_EFFORT = %w(2 2 2 2 2 2 1 1 1 1 1 1 2 3 1 0 0 0 0 1 1 1 1 1 1 2 2 2 2 2 2 1 1 1 1 1 1 2 3 1 0 0 0 0 1 1 1 1 1 1).collect { |el| el.to_i }
    COMBINED_EFFORT = LEFT_EFFORT + RIGHT_EFFORT

    class Qwerty < Keyboard
      NAME = "qwerty"
      LEFT_KEYS = %w(` 1 2 3 4 5 6 q w e r t a s  d f g z x c v b ~ ! @ # $ % ^ Q W E R T A S D F G Z X C V B)
      RIGHT_KEYS = %w(7 8 9 0 - = y u i o p [ ] \\ h j k l ; ' n m , . / & * ( ) _ + Y U I O P { } | H J K L : " N M < > ?)
      COMBINED_KEYS = LEFT_KEYS + RIGHT_KEYS
      MAP = Hash[COMBINED_KEYS.zip(Keyboard::COMBINED_EFFORT)]
    end

    class Dvorak < Keyboard
      NAME = "dvorak"
      LEFT_KEYS = %w(` 1 2 3 4 5 6 ' , . p y a o  e u i ; q j k x ~ ! @ # $ % ^ " < > P Y A O E U I : Q J K X)
      RIGHT_KEYS = %w(7 8 9 0 [ ] f g c r l / = \\ d h t n s - b m w v z & * ( ) { } F G C R L ? + | D H T N S _ B M W V Z)
      COMBINED_KEYS = LEFT_KEYS + RIGHT_KEYS
      MAP = Hash[COMBINED_KEYS.zip(Keyboard::COMBINED_EFFORT)]
    end

    class Colemak < Keyboard
      NAME = "colemak"
      LEFT_KEYS = %w(` 1 2 3 4 5 6 q w f p g a r  s t d z x c v b ~ ! @ # $ % ^ Q W F P G A R S T D Z X C V B)
      RIGHT_KEYS = %w(7 8 9 0 - = j l u y : [ ] \\ h n e i o ' k m , . / & * ( ) _ + J L U Y ; { } | H N E I O " K M < > ?)
      COMBINED_KEYS = LEFT_KEYS + RIGHT_KEYS
      MAP = Hash[COMBINED_KEYS.zip(Keyboard::COMBINED_EFFORT)]
    end

  end
end

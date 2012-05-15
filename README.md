# KeyboardBattle

KeyboardBattle is a simple program that compares the performance of keyboard layouts according to two metrics, reach effort (travel from the home row being increasingly effortful) and alternation effort (typing consecutive keys with a single hand being more effortful). For both, a lower value means less effort.

The program comes with the QWERTY and Dvorak layouts. The format for a keyboard layout description file can be discerned from lib/keyboards/*.txt.

# Usage

E.g.: `ruby -w examples/do_battle.rb`

# Limitations and shortcomings

At the moment, the script is not packaged up in any useful way, so the way to run it against a text is to add that text to the `texts` directory.

Only ASCII characters will be counted (though any character may appear in a text file).

# Testing

`ruby -w test/keyboard_battle_test.rb`.

Tests are written with [MiniTest](https://github.com/seattlerb/minitest), so be on ruby 1.9 or get the `minitest` gem.


# Bundled texts

Except for "the quick brown fox," bundled texts are sourced from archive.org.

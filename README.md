# KeyboardBattle

KeyboardBattle is a simple program that compares the performance of keyboard layouts according to two metrics, reach effort (travel from the home row being increasingly effortful) and alternation effort (typing consecutive keys with a single hand being more effortful). For both, a lower value means less effort.

The program comes with the QWERTY, Dvorak, and Colemak layouts. The format for a keyboard layout description file can be discerned from `lib/keyboards/*.txt`.

## Installation

    $ gem install keyboard_battle

## Usage

E.g., `keyboard_battle my_text.txt`, or try `keyboard_battle --bundled`

## Limitations and shortcomings

Only ASCII characters will be counted (though any character may appear in the source text).

## Bundled texts

Except for "the quick brown fox," bundled texts are sourced from archive.org.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

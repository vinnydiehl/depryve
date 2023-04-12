# depryve

Ever end up writing half of your program in the console, and need to either
copy and paste line-by-line, or do some text editor wizardry to get rid of the
prompts and output? No more. Just run `depryve` and it modifies your clipboard
in-place, getting rid of the extraneous info.

Install with RubyGems:

    gem install depryve

## X11 Selections

`depryve` reads your primary selection (the "middle click clipboard") by default;
this is the "clipboard" that is copied to whenever you highlight text, making
usage super easy; just highlight, run `depryve`, then paste wherever you
please. If you would like `depryve` to read from your clipboard selection (the
"Ctrl+C clipboard"), run `depryve -c`.

The output from `depryve` will be placed on all of your clipboards, so you may
paste it with either Ctrl+V or middle click.

## From the REPL

You may require `depryve` from an `irb` or `pry` session and run it at any time
by running one of the included methods:

```ruby
require "depryve"

# write your code...
# whenever you want to copy something highlight it and:
depryve

# or, to run with the -c flag:
depryve_c
```

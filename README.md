# depryve

Ever end up writing half of your program in the console, and need to either
copy and paste line-by-line, or do some text editor wizardry to get rid of the
prompts and output? No more. Just run `depryve` and it modifies your clipboard
in-place, getting rid of the extraneous info.

Install with RubyGems:

    gem install depryve

## Linux Support

That is to say, right now this only works well with Linux. It uses the X11
primary clipboard (the one that text is copied to when you select it, and
pasted with the middle mouse button). The output is sent to all clipboards.
Support for other clipboards coming if there is demand.

## Contributing

If anyone wants to modify this to make it work better/with more setups, great.
There's only 5 lines of code in here right now. It's MIT licensed, feel free to
fork it. Maybe send a pull request.

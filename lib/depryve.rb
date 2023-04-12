require "clipboard"

def depryve(argv=[])
  # Defined in this scope so that nothing extraneous is created
  # when this gem is required in a REPL session
  prompt = /\A(irb|\[\d+\] pry)/

  # Use X11 primary selection by default
  selection = argv.include?("-c") ? :clipboard : :primary

  Clipboard.copy(Clipboard.paste(selection).lines.select { |ln| ln =~ prompt }.map do |line|
    line.gsub(/#{prompt}[^ ]+ ?/, "")
  end.join.strip)
end

def depryve_c
  depryve ["-c"]
end

TEST_CASES = {
  "removes return values": {
    irb: <<~EOS.chop,
      irb(main):003:0> 1 + 1
      => 2
    EOS
    pry: <<~EOS.chop,
      [1] pry(main)> 1 + 1
      => 2
    EOS
    result: <<~EOS.chop
      1 + 1
    EOS
  },

  "removes STDOUT output": {
    irb: <<~EOS.chop,
      irb(main):024:0> puts "Hello world!"
      Hello world!
      => nil
    EOS
    pry: <<~EOS.chop,
      [2] pry(main)> puts "Hello world!"
      Hello world!
      => nil
    EOS
    result: <<~EOS.chop
      puts "Hello world!"
    EOS
  },

  "removes error messages": {
    irb: <<~EOS.chop,
      irb(main):028:0> "foo"
      => "foo"
      irb(main):029:0> wtf
      (irb):29:in `<main>': undefined local variable or method `wtf' for main:Object (NameError)
          from /path/to/.rbenv/versions/3.2.1/lib/ruby/gems/3.2.0/gems/irb-1.6.4/exe/irb:9:in `<top (required)>'
          from /path/to/.rbenv/versions/3.2.1/bin/irb:25:in `load'
          from /path/to/.rbenv/versions/3.2.1/bin/irb:25:in `<main>'
      irb(main):030:0> "bar"
      => "bar"
    EOS
    pry: <<~EOS.chop,
      [9] pry(main)> "foo"
      => "foo"
      [10] pry(main)> wtf
      Exception: NameError: undefined local variable or method `wtf' for main:Object
      --
      0: (pry):6:in `__pry__'
      1: /path/to/.rbenv/versions/3.2.1/lib/ruby/gems/3.2.0/gems/pry-0.14.2/lib/pry/pry_instance.rb:290:in `eval'
      2: /path/to/.rbenv/versions/3.2.1/lib/ruby/gems/3.2.0/gems/pry-0.14.2/lib/pry/pry_instance.rb:290:in `evaluate_ruby'
      3: /path/to/.rbenv/versions/3.2.1/lib/ruby/gems/3.2.0/gems/pry-0.14.2/lib/pry/pry_instance.rb:659:in `handle_line'
      4: /path/to/.rbenv/versions/3.2.1/lib/ruby/gems/3.2.0/gems/pry-0.14.2/lib/pry/pry_instance.rb:261:in `block (2 levels) in eval'
      [11] pry(main)> "bar"
      => "bar"
    EOS
    result: <<~EOS.chop
      "foo"
      wtf
      "bar"
    EOS
  },

  "doesn't get tripped up by the > operator": {
    irb: <<~EOS.chop,
      irb(main):031:0> 3 > 2 ? "foo" : "bar"
      => "foo"
    EOS
    pry: <<~EOS.chop,
      [12] pry(main)> 3 > 2 ? "foo" : "bar"
      => "foo"
    EOS
    result: <<~EOS.chop
      3 > 2 ? "foo" : "bar"
    EOS
  },

  "removes blank lines": {
    irb: <<~EOS.chop,
      irb(main):037:0>
      irb(main):038:0>
      irb(main):039:0> "foo"
      => "foo"
      irb(main):040:0>
      irb(main):041:0>
      irb(main):042:0> "bar"
      => "bar"
      irb(main):043:0>
      irb(main):044:0>
    EOS
    pry: <<~EOS.chop,
      [16] pry(main)>
      [17] pry(main)>
      [18] pry(main)> "foo"
      => "foo"
      [19] pry(main)>
      [20] pry(main)>
      [21] pry(main)> "bar"
      => "bar"
      [22] pry(main)>
      [23] pry(main)>
    EOS
    result: <<~EOS.chop
      "foo"
      "bar"
    EOS
  },

  "handles indentation correctly": {
    irb: <<~EOS.chop,
      irb(main):044:1* def foo(n)
      irb(main):045:2*   if n < 3
      irb(main):046:2*     puts "bar"
      irb(main):047:2*   else
      irb(main):048:2*     puts "baz"
      irb(main):050:1*   end
      irb(main):051:0> end
      => :foo
    EOS
    pry: <<~EOS.chop,
      [26] pry(main)> def foo(n)
      [26] pry(main)*   if n < 3
      [26] pry(main)*     puts "bar"
      [26] pry(main)*   else
      [26] pry(main)*     puts "baz"
      [26] pry(main)*   end
      [26] pry(main)* end
      => :foo
    EOS
    result: <<~EOS.chop
      def foo(n)
        if n < 3
          puts "bar"
        else
          puts "baz"
        end
      end
    EOS
  }
}

require "spec_helper"

describe "#depryve" do
  %i[irb pry].each do |repl|
    context "when the clipboard contains output from #{repl}" do
      TEST_CASES.each do |title, test|
        it title do
          allow(Clipboard).to receive(:paste).and_return test[repl]
          expect(Clipboard).to receive(:copy).with test[:result]
          depryve
        end
      end
    end
  end
end

describe "#depryve_c" do
  it "calls #depryve as if running `depryve -c`" do
    expect_any_instance_of(Object).to receive(:depryve).with ["-c"]
    depryve_c
  end
end

describe "the executable" do
  before(:each) do
    allow(Clipboard).to receive :copy
  end

  context "when passed no args" do
    it "uses the X11 primary selection" do
      expect(Clipboard).to receive(:paste).with(:primary)
      depryve rescue nil
    end
  end

  context "when passed a -c flag" do
    it "uses the X11 clipboard selection" do
      expect(Clipboard).to receive(:paste).with(:clipboard)
      depryve ["-c"] rescue nil
    end
  end
end

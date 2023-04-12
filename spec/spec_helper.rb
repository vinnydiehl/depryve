require "depryve"
require "test_cases"

RSpec.configure do |config|
  # Add `focus: true` hash parameter to a describe/context/it block
  # to only run the specs in that block
  config.filter_run_when_matching :focus

  # Fuubar
  config.add_formatter "Fuubar"
  config.fuubar_progress_bar_options = { format: "  %c/%C |%b>%i|%e " }

  # More verbose output if only running one spec
  config.default_formatter = "doc" if config.files_to_run.one?

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, fix the order by providing the seed,
  # which is printed after each run, e.g. --seed 1234
  config.order = :random
  Kernel.srand config.seed
end

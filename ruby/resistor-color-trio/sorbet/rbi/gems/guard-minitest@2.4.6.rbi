# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `guard-minitest` gem.
# Please instead update this file by running `bin/tapioca gem guard-minitest`.

# source://guard-minitest//lib/guard/minitest.rb#3
module Guard
  extend ::Guard::Internals::Helpers

  class << self
    # source://guard/2.18.1/lib/guard.rb#87
    def async_queue_add(changes); end

    # source://guard/2.18.1/lib/guard.rb#73
    def init(cmdline_options); end

    # source://guard/2.18.1/lib/guard.rb#24
    def interactor; end

    # source://guard/2.18.1/lib/guard.rb#23
    def listener; end

    # source://guard/2.18.1/lib/guard.rb#22
    def queue; end

    # source://guard/2.18.1/lib/guard.rb#44
    def setup(cmdline_options = T.unsafe(nil)); end

    # source://guard/2.18.1/lib/guard.rb#21
    def state; end

    private

    # source://guard/2.18.1/lib/guard.rb#132
    def _evaluate(options); end

    # source://guard/2.18.1/lib/guard.rb#152
    def _guardfile_deprecated_check(modified); end

    # source://guard/2.18.1/lib/guard.rb#113
    def _listener_callback; end

    # source://guard/2.18.1/lib/guard.rb#128
    def _pluginless_guardfile?; end

    # source://guard/2.18.1/lib/guard.rb#109
    def _relative_pathnames(paths); end

    # source://guard/2.18.1/lib/guard.rb#99
    def _relevant_changes?(changes); end
  end
end

# source://guard-minitest//lib/guard/minitest.rb#4
class Guard::Minitest < ::Guard::Plugin
  # @return [Minitest] a new instance of Minitest
  #
  # source://guard-minitest//lib/guard/minitest.rb#11
  def initialize(options = T.unsafe(nil)); end

  # source://guard-minitest//lib/guard/minitest.rb#28
  def reload; end

  # source://guard-minitest//lib/guard/minitest.rb#32
  def run_all; end

  # source://guard-minitest//lib/guard/minitest.rb#40
  def run_on_additions(paths); end

  # source://guard-minitest//lib/guard/minitest.rb#36
  def run_on_modifications(paths = T.unsafe(nil)); end

  # source://guard-minitest//lib/guard/minitest.rb#44
  def run_on_removals(paths); end

  # Returns the value of attribute runner.
  #
  # source://guard-minitest//lib/guard/minitest.rb#9
  def runner; end

  # Sets the attribute runner
  #
  # @param value the value to set the attribute runner to.
  #
  # source://guard-minitest//lib/guard/minitest.rb#9
  def runner=(_arg0); end

  # source://guard-minitest//lib/guard/minitest.rb#19
  def start; end

  # source://guard-minitest//lib/guard/minitest.rb#24
  def stop; end

  private

  # source://guard-minitest//lib/guard/minitest.rb#50
  def throw_on_failed_tests; end
end

# source://guard-minitest//lib/guard/minitest/inspector.rb#5
class Guard::Minitest::Inspector
  # @return [Inspector] a new instance of Inspector
  #
  # source://guard-minitest//lib/guard/minitest/inspector.rb#8
  def initialize(test_folders, test_file_patterns); end

  # source://guard-minitest//lib/guard/minitest/inspector.rb#32
  def all_test_files; end

  # source://guard-minitest//lib/guard/minitest/inspector.rb#17
  def clean(paths); end

  # source://guard-minitest//lib/guard/minitest/inspector.rb#13
  def clean_all; end

  # source://guard-minitest//lib/guard/minitest/inspector.rb#28
  def clear_memoized_test_files; end

  # Returns the value of attribute test_file_patterns.
  #
  # source://guard-minitest//lib/guard/minitest/inspector.rb#6
  def test_file_patterns; end

  # Returns the value of attribute test_folders.
  #
  # source://guard-minitest//lib/guard/minitest/inspector.rb#6
  def test_folders; end

  private

  # source://guard-minitest//lib/guard/minitest/inspector.rb#49
  def _join_for_glob(fragments); end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/inspector.rb#45
  def _test_file?(path); end

  # source://guard-minitest//lib/guard/minitest/inspector.rb#38
  def _test_files_for_paths(paths = T.unsafe(nil)); end
end

# source://guard-minitest//lib/guard/minitest/runner.rb#6
class Guard::Minitest::Runner
  # @return [Runner] a new instance of Runner
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#9
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute inspector.
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#7
  def inspector; end

  # Sets the attribute inspector
  #
  # @param value the value to set the attribute inspector to.
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#7
  def inspector=(_arg0); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#35
  def run(paths, options = T.unsafe(nil)); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#60
  def run_all; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#70
  def run_on_additions(_paths); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#65
  def run_on_modifications(paths = T.unsafe(nil)); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#75
  def run_on_removals(_paths); end

  private

  # source://guard-minitest//lib/guard/minitest/runner.rb#138
  def _commander(paths); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#125
  def _run(*args); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#132
  def _run_possibly_bundled_command(paths, all); end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#105
  def all_after_pass?; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#219
  def all_env; end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#228
  def all_paths?(paths); end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#121
  def autorun?; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#215
  def base_env; end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#85
  def bundler?; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#81
  def cli_options; end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#93
  def drb?; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#157
  def drb_command(paths); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#211
  def generate_env(all = T.unsafe(nil)); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#201
  def generate_includes(include_test_folders = T.unsafe(nil)); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#113
  def include_folders; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#145
  def minitest_command(paths, all); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#232
  def parse_deprecated_options; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#224
  def relative_paths(paths); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#177
  def ruby_command(paths); end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#89
  def rubygems?; end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#101
  def spring?; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#166
  def spring_command(paths); end

  # source://guard-minitest//lib/guard/minitest/runner.rb#117
  def test_file_patterns; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#109
  def test_folders; end

  # @return [Boolean]
  #
  # source://guard-minitest//lib/guard/minitest/runner.rb#97
  def zeus?; end

  # source://guard-minitest//lib/guard/minitest/runner.rb#161
  def zeus_command(paths); end
end

# source://guard-minitest//lib/guard/minitest/utils.rb#7
class Guard::Minitest::Utils
  class << self
    # source://guard-minitest//lib/guard/minitest/utils.rb#8
    def minitest_version; end

    # @return [Boolean]
    #
    # source://guard-minitest//lib/guard/minitest/utils.rb#19
    def minitest_version_gte_5?; end

    # @return [Boolean]
    #
    # source://guard-minitest//lib/guard/minitest/utils.rb#23
    def minitest_version_gte_5_0_4?; end
  end
end

# source://guard-minitest//lib/guard/minitest/version.rb#2
class Guard::MinitestVersion; end

# source://guard-minitest//lib/guard/minitest/version.rb#3
Guard::MinitestVersion::VERSION = T.let(T.unsafe(nil), String)

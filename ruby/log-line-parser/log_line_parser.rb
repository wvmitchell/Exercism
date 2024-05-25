class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.match(/(?<=\s).+$/).to_s.strip
  end

  def log_level
    @line.match(/(?<=\[).+(?=\])/).to_s.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

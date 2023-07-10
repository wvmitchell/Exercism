class LogLineParser
  MESSAGE_REGEXP = /\s.*$/
  TYPE_REGEXP = /\[\w*\]/

  def initialize(line)
    @line = line
  end

  def message
    raw_message = MESSAGE_REGEXP.match(@line)[0]
    raw_message.strip
  end

  def log_level
    raw_type = TYPE_REGEXP.match(@line)[0]
    raw_type.gsub(/\[|\]/, '').downcase
  end

  def reformat
    raw_message = MESSAGE_REGEXP.match(@line)[0]
    raw_type = TYPE_REGEXP.match(@line)[0]
    message = raw_message.strip
    type = raw_type.gsub('[', '(').gsub(']',')').downcase
    "#{message} #{type}"
  end
end

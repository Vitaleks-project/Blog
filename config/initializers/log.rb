class ActiveSupport::BufferedLogger
  def formatter=(formatter)
    @log.formatter = formatter
  end
end
 
class Formatter
  def call(severity, time, progname, msg)
    msg.gsub!(/\[\w+\]/, '')
    msg = "\033[32m#{msg}\033[0m" if msg.match(/^ ?Started/)
    "#{msg}\n"
  end
end
 
Rails.logger.formatter = Formatter.new

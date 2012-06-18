module ActiveSupport
  # log errors in red
  class BufferedLogger
    alias_method :orig_error, :error
    def error(msg)
      if Rails.env != :production
        msg = "\e[1;31m#{msg}\e[0m"
      end

      orig_error msg
    end

    alias_method :orig_debug, :debug
    def debug(msg)
      if Rails.env != :production
        msg = "\e[3;33m#{msg}\e[0m"
      end

      orig_debug msg
    end

  end
end

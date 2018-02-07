class String
  UNSAFETY_WORDS = File.read("#{Rails.root}/config/unsafety_words.txt").split("\n")
  UNSAFETY_REGEX = /(#{UNSAFETY_WORDS.join('|')})/

  def safety?
    return true if self.blank?
    return true if UNSAFETY_WORDS.blank?
    self !~ UNSAFETY_REGEX
  end

  def strimwidth(start=0, width=35, trimmarker = "...")
    split_str = self.split(//)
    if split_str.length < start
      ''
    elsif split_str.length > width
      split_str[start..width-1].join + trimmarker
    else
      split_str[start..width-1].join
    end
  end

  def nl2br(options={})
    str = self
    if options[:raw].nil?
      str = CGI::escapeHTML(str)
    end
    if options[:use_line_feed]
      str.gsub(/\r\n|\r|\n/, "\n<br />").html_safe
    else
      str.gsub(/\r\n|\r|\n/, "<br />").html_safe
    end
  end
end

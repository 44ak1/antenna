class String
  UNSAFETY_WORDS = File.read("#{Rails.root}/config/unsafety_words.txt").split("\n")
  UNSAFETY_REGEX = /(#{UNSAFETY_WORDS.join('|')})/

  def safety?
    return true if self.blank?
    return true if UNSAFETY_WORDS.blank?
    self !~ UNSAFETY_REGEX
  end
end

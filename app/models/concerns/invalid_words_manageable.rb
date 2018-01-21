module InvalidWordsManageable
  extend ActiveSupport::Concern

  INVALID_WORDS = YAML.load(File.read("#{Rails.root}/config/invalid_words.yml"))

  REMOVE_REGEX = /#{INVALID_WORDS["removal"].join('|')}/
  REPLACE_REGEX = /#{INVALID_WORDS["replace"].map{ |w| w["before"] }.join('|')}/
  REPLACE_HASH = Hash[ *INVALID_WORDS["replace"].map{ |w| [w["before"], w["after"]] }.flatten ]

  module ClassMethods
    def remove_and_replace_words!(words)
      return if words.blank?
      self.remove_words!(words)
      self.replace_words!(words)
    end

    def remove_words!(words)
      words.gsub!(REMOVE_REGEX, '')
    end

    def replace_words!(words)
      words.gsub!(REPLACE_REGEX, REPLACE_HASH)
    end
  end
end

class Site < ApplicationRecord
  CATEGORIES = %w(2ch news entame sports life otaku world adult)

  has_many :archives, dependent: :destroy

  validates :name, :url, :rss_url, presence: true, uniqueness: true
  validates :name, length: { in: 1..100 }
  validates :category_code, inclusion: { in: CATEGORIES }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  default_scope -> { order(:id) }
  scope :active, -> { where(is_active: true) }
  scope :crawlable, -> { active }

  def fetch_archives!
    return unless is_crawlable?

    begin
      ActiveRecord::Base.transaction do
        rss_entries.each do |item|
          body = open(item.url) do |io|
            charset = io.charset
            html = io.read
            body, title = ExtractContent.analyse(html)
            body
          end

          self.archives.create!(
            title:        item.title || title,
            url:          item.url,
            description:  (item.content || item.summary),
            body:         body,
            published_at: item.published.to_time,
          )
        end
        self.successed_at = Time.now
        save!
      end
    rescue
      self.errored_at = Time.now
      save!
    end
  end

  def rss_entries
    rss = Feedjira::Feed.fetch_and_parse self.rss_url
    rss.entries
  end
end

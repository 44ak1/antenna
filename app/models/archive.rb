class Archive < ApplicationRecord
  include InvalidWordsManageable

  mount_uploader :image, ImageUploader

  belongs_to :site
  delegate :category_code, to: :site, allow_nil: false
  delegate :name, to: :site, prefix: :site, allow_nil: false

  validates :url, :title, :published_at, presence: true
  validates :url, uniqueness: true
  validates_integrity_of :image

  before_create :set_uuid

  before_validation :set_image
  before_validation :set_safety
  before_validation do
    self.class.remove_and_replace_words!(self.title)
    self.class.remove_and_replace_words!(self.description)
  end

  before_destroy do
    remove_image!
  end

  default_scope -> { order(created_at: :desc) }
  scope :active, -> { where(is_active: true) }
  scope :safety, -> { where(is_safety: true) }
  scope :pickups, -> from: 7.days.ago, max: 3 {
    where('archives.created_at >= ? AND image IS NOT NULL', from).take(max)
  }

  def set_uuid
    self.uuid = 'ah' << SecureRandom.urlsafe_base64(13)
  end

  def set_image
    return self.image if self.image.present?
    html = Nokogiri::HTML(self.description)
    src = html.css('img').map{ |img| img[:src] }.first
    self.real_image_url = src
    self.remote_image_url = src
  end

  def set_safety
    self.is_safety =
      if self.category_code == 'adult'
        false
      elsif self.title.safety? && self.description.safety?
        true
      else
        false
      end
  end

=begin
  searchable(auto_index: false) do
    integer :id
    string :archive_id do
      archive_id
    end
    text :ymd
    text :hour
    text :site_id
    text :site_name
    text :title
    text :url
    text :description
    text :thumbnail
    integer :pv
    text :category
    boolean :is_adult
    text :tag
    text :search_text
  end
  def search

  end
=end

end

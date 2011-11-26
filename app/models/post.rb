class Post < ActiveRecord::Base

  before_create :create_slug

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
  validates :post_date, presence: true

  acts_as_taggable
  mount_uploader :image, ImageUploader

  default_scope order: 'post_date desc'
  scope :published, where('draft = ? and post_date <= ?', 'f', Time.zone.today)

  def to_s
    name
  end

  def to_param
    "#{self.id}-#{self.slug}"
  end

  def self.recent(count)
    self.order('created_at desc').limit(count)
  end

  def permalink
    "http://#{Rails.configuration.host}/#{self.slug}"
  end

  private

  def create_slug
    self.slug = self.name.parameterize if self.slug.blank?
  end
end

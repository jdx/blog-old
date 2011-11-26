class Post < ActiveRecord::Base

  before_create :create_slug, uniqueness: true
  before_update :create_slug, uniqueness: true

  validates :name, presence: true
  validates :body, presence: true
  validates :post_date, presence: true

  acts_as_taggable
  mount_uploader :image, ImageUploader

  def to_s
    name
  end

  def to_param
    self.slug
  end

  def self.recent(count)
    self.order('created_at desc').limit(count)
  end

  def permalink
    "http://#{Rails.configuration.host}/#{to_param}"
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end
end

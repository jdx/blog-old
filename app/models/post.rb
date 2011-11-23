class Post < ActiveRecord::Base

  before_create :create_slug
  before_update :create_slug

  validates :name, presence: true
  validates :body, presence: true
  validates :post_date, presence: true

  acts_as_taggable
  mount_uploader :image, ImageUploader

  def to_s
    name
  end

  def to_param
    "#{ id }-#{ self.slug }"
  end

  def self.recent(count)
    self.order('created_at desc').limit(count)
  end

  def permalink
    "http://#{Rails.configuration.host}/#{post_date.year}/#{post_date.month}/#{post_date.day}/#{to_param}"
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end
end

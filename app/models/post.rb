class Post < ActiveRecord::Base
  include ActionView::Helpers

  before_create :create_slug
  before_update :create_slug

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
  validates :post_date, presence: true
  validates :commenting, presence: true

  mount_uploader :image, ImageUploader

  scope :published, -> { where(draft: false).where('post_date <= ?', Time.zone.today) }

  scope :tagged_with, -> (tag) { where('tags @> ARRAY[?]::varchar(255)[]', tag) }

  def to_s
    name
  end

  def to_param
    "#{self.id}-#{self.slug}"
  end

  def word_count
    body.scan(/(\w|-)+/).size
  end

  def self.recent(count)
    self.order('created_at desc').limit(count)
  end

  def permalink(host=Rails.configuration.host)
    "http://#{host}/#{self.slug}"
  end

  def related
    Post.published.where('tags && ARRAY[?]::varchar(255)[]', tags).where.not(id: id).limit(5).order('post_date desc')
  end

  private

  def create_slug
    self.slug = self.name.parameterize if self.slug.blank?
  end
end

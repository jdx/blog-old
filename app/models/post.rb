class Post < ActiveRecord::Base
  include ActionView::Helpers

  before_create :create_slug
  before_update :create_slug

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
  validates :post_date, presence: true
  validates :commenting, presence: true

  acts_as_taggable
  mount_uploader :image, ImageUploader

  default_scope order: 'post_date desc'

  def to_s
    name
  end

  def to_param
    "#{self.id}-#{self.slug}"
  end

  def word_count
    strip_tags(body_html).scan(/(\w|-)+/).size
  end

  def body_html
    body_html = Rails.cache.fetch "#{cache_key}/body_html" do
      options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
      syntax_highlighter(Redcarpet.new(body, *options).to_html)
    end
    return body_html.html_safe
  end

  def syntax_highlighter(text)
    text = text.gsub(/\<pre( lang="(.+?)")?\>\<code\>(.+?)\<\/code\><\/pre\>/m) do
      code = HTMLEntities.new.decode $3
      CodeRay.scan(code, $2).div(:css => :class)
    end
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

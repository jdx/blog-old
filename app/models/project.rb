class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :body, presence: true

  def to_s
    name
  end

  def permalink
    "http://#{Rails.configuration.host}/projects/#{slug}"
  end

  def to_param
    "#{ self.id }-#{ self.slug }"
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

end

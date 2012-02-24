module ApplicationHelper
  def markdown(text)
    options = [ :hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode ]
    html = RedcarpetCompat.new(text, *options).to_html
    return syntax_highlighter(html).html_safe
  end

  def decode_entities(text)
    HTMLEntities.new.decode(text)
  end

  private

  def syntax_highlighter(text)
    text = text.gsub(/\<pre( lang="(.+?)")?\>\<code\>(.+?)\<\/code\><\/pre\>/m) do
      code = decode_entities($3)
      CodeRay.scan(code, $2).div(:css => :class)
    end
  end

end

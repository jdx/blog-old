module ApplicationHelper
  def markdown(text, options = {})
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(text)
    text = text.gsub(/\<pre( lang="(.+?)")?\>\<code\>(.+?)\<\/code\><\/pre\>/m) do
      code = HTMLEntities.new.decode $3
      CodeRay.scan(code, $2).div(:css => :class)
    end
  end

end

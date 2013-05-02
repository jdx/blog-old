module ApplicationHelper
  def markdown(text)
    options = [ :hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode ]
    RedcarpetCompat.new(text, *options).to_html.html_safe
  end

  def decode_entities(text)
    HTMLEntities.new.decode(text)
  end
end

module ApplicationHelper
  def markdown(text)
    options = [:autolink, :no_intraemphasis, :fenced_code]
    Redcarpet.new(text, *options).to_html.html_safe
  end
end

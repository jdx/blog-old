xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  for project in @projects do
    xml.url do
      xml.loc project.permalink
      xml.lastmod project.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority "0.6"
    end
  end
  for post in @posts do
    xml.url do
      xml.loc post.permalink
      xml.lastmod post.updated_at.to_date
      xml.changefreq "weekly"
      xml.priority "0.5"
    end
  end
end

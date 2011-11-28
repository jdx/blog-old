xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Jeff Dickey's personal blog"
    xml.description "Jeff Dickey's personal blog"
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post
        xml.description post.body
        xml.pubDate post.post_date.to_s(:rfc822)
        xml.link post.permalink
        xml.guid post.permalink
      end
    end
  end
end

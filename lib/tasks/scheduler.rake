desc "Notifies Google about a possibly updated sitemap.xml file"
task :update_sitemap => :environment do
  puts 'Notifying google about new sitemap...'
  HTTParty.get 'http://www.google.com/webmasters/tools/ping', sitemap: 'http://dickey.xxx/sitemap.xml'
  puts 'done.'
end

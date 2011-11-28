desc "Notifies Google about a possibly updated sitemap.xml file"
task :update_sitemap => :environment do
  puts 'Notifying google about new sitemap...'
  HTTParty.get 'http://www.google.com/webmasters/tools/ping', sitemap: 'http://jeffdickey.info/sitemap.xml'
  puts 'done.'
end

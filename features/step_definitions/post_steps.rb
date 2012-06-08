When /^there is a post named "([^"]*)"$/ do |name|
  FactoryGirl.create(:post, name: name)
end

When /^there is a draft post named "([^"]*)"$/ do |name|
  FactoryGirl.create(:post, name: name, draft: true)
end

When /^there is a post named "([^"]*)" scheduled to be posted tomorrow$/ do |name|
  FactoryGirl.create(:post, name: name, post_date: Date.tomorrow)
end

When /^I visit the sitemap$/ do
  visit "/sitemap.xml"
end

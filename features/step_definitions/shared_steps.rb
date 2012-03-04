When /^I am on the home page$/ do
  visit "/"
end

When /^I follow "([^"]*)"$/ do |link_text|
  click_link link_text
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content text
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content text
end

Then /^show me the page$/ do
  save_and_open_page
end

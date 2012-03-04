When /^there is a post named "([^"]*)"$/ do |name|
  Factory(:post, name: name)
end

When /^there is a draft post named "([^"]*)"$/ do |name|
  Factory(:post, name: name, draft: true)
end

When /^there is a post named "([^"]*)" scheduled to be posted tomorrow$/ do |name|
  Factory(:post, name: name, post_date: Date.tomorrow)
end

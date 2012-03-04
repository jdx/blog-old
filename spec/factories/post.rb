FactoryGirl.define do
  factory :post do
    name 'Python vs Ruby'
    body 'Ruby is better'
    post_date Date.yesterday
    draft false
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    sequence(:subject) { |n| "#{n} subject" }
    body "Issue body"
    sequence(:customer_name) { |n| "name #{n}" }
    sequence(:customer_email) { |n| "email #{n}" }
    association :department
  end
end

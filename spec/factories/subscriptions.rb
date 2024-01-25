FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { rand(15.0..40.0).round(2) }
    status { 1 }
    frequency { rand(10..30) }
    tea { association :tea }
    customer { association :customer }
  end
end

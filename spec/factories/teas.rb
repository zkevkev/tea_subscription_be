FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Marketing.buzzwords }
    temperature { rand(175..212) }
    brew_time { rand(2..5) }
  end
end

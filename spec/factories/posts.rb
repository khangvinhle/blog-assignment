FactoryBot.define do
  factory :post do
    user
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    approved { true }
    like { 0 }
    share { 0 }
    star { 0 }
  end
end

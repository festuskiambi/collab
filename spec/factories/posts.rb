FactoryBot.define do
  factory :post do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    user
    category    
  end
end

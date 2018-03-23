FactoryBot.define do
  factory :category do
    name {Faker::Lorem.word}
    branch {Faker::Lorem.word}
    
  end
end

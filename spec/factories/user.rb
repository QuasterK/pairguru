FactoryBot.define do
  factory :user do
    name { Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Lorem.characters(char_count = 10)} 
  end
end

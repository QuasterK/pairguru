FactoryBot.define do
  factory :user do
    name { Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Lorem.characters(char_count = 10)}

    trait :with_comments do
      after(:create) do |user|
        create_list :comment, 10, user: user
      end
    end
  end
end

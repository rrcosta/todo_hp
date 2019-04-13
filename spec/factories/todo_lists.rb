FactoryBot.define do
  factory :todo_list do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    done { false }
    user
  end
end

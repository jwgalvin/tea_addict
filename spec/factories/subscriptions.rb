FactoryBot.define do
  factory :subscription do
    title { Faker::Name.name_with_middle }
    customer { nil }
  end
end

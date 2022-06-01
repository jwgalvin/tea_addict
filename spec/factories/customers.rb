FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::TvShows::TheITCrowd.email }
    address { Faker::TvShows::TwinPeaks.location }
  end
end

FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password "password"
    password_confirmation "password"
  end

  factory :phrase do
    user
    phrase { Faker::Pokemon.name }
    translation { Faker::Pokemon.location }
  end

  factory :example do
    user
    phrase
    example { Faker::LordOfTheRings.character }
  end

end

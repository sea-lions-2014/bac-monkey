FactoryGirl.define do
  factory :user do params =
    user_name "David"
    email "email@yesanemail.com"
    password_digest BCrypt::Password.create("password")
    gender 'm'
    weight 123
  end

  factory :non_user, class: User do
    user_name "David"
    email "notanemail"
    password_digest "password"
    gender 'm'
    weight 123
  end

  factory :empty_params, class: User do
  end
end
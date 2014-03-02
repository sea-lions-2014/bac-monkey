FactoryGirl.define do
  
  factory :user do
    user_name "David"
    email "email@yesanemail.com"
    password "password"
    gender 'm'
    weight 123
  end

  factory :non_user, class: User do
    user_name "David"
    email "notanemail"
    password "password"
    gender 'm'
    weight 123
  end

  factory :empty_params, class: User do

  factory :consumption_record do
    substance { "caffeine" }
    amount { 200 }
    unit_of_measure { "mg" }
  end

  factory :single_drink, class: ConsumptionRecord do
    substance { "alcohol" }
    amount { 1 }
    unit_of_measure { "drink" } 
  end
end
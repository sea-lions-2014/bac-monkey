FactoryGirl.define do
  factory :consumption_record do
    substance { "caffeine" }
    amount { 200 }
    unit_of_measure { "mg" }
  end
end
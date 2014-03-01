FactoryGirl.define do
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
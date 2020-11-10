FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    password { 'password123' }


    factory :doctor do
      association :role, factory: :doctor_role
    end

    factory :patient do
      association :role, factory: :patient_role
    end
  end
end
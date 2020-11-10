FactoryBot.define do
  factory :role do
    factory :doctor_role do
      name { 'doctor' }
    end

    factory :patient_role do
      name { 'patient' }
    end
  end
end
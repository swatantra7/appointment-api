FactoryBot.define do
  factory :appointment do
    from { Time.now }
    to { Time.now }
    factory :doctor_appointment do
      association :users_slot, factory: :slots
      association :patient, factory: :patient
      association :doctor, factory: :doctor
    end
  end
end
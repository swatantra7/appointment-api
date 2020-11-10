FactoryBot.define do
  factory :slots, class: 'Users::Slot' do
    schedule_from { Time.now }
    schedule_to { Time.now }
    factory :doctor_slot do
      association :user, factory: :doctor
    end
  end
end
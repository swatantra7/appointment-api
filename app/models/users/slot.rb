class Users::Slot < ApplicationRecord

  include AASM

  acts_as_api

  aasm column: :status, whiny_transitions: false do

    state :avaliable, initial: true
    state :booked

    event :book do
      transitions from: :avaliable, to: :booked
    end

  end

  belongs_to :user

  api_accessible :details do |t|
    t.add :user_id, as: :doctor_id
    t.add :schedule_from
    t.add :schedule_to
  end

end

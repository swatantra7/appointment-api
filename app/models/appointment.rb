class Appointment < ApplicationRecord

  acts_as_api

  before_create :assign_to_from
  after_create :update_user_slot
  belongs_to :users_slot, class_name: '::Users::Slot'

  validates_uniqueness_of :users_slot_id

  api_accessible :details do |t|
    t.add :id
    t.add :doctor_id
    t.add :from, as: :schedule_from
    t.add :to, as: :schedule_to
  end

  private

  def assign_to_from
    self.from = users_slot.schedule_from
    self.to = users_slot.schedule_to
  end

  def update_user_slot
    self.users_slot.book!
  end

end

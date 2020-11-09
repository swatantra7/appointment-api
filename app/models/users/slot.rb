class Users::Slot < ApplicationRecord

  belongs_to :user

  def self.avaliable
    appointments = Appointment.where(from: Date.today.beginning_of_week..Date.today.end_of_week)
    user_slot_id = appointments.pluck(:users_slot_id)
    all.where.not(id: user_slot_id)
  end

end

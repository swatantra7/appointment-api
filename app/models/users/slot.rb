class Users::Slot < ApplicationRecord

  acts_as_api

  belongs_to :user

  scope :avaliable, -> {where.not(status: 'booked')}

  api_accessible :details do |t|
    t.add :user_id, as: :doctor_id
    t.add :schedule_from
    t.add :schedule_to
  end

  private

  def schedule_from

  end

  def schedule_to
  end

end

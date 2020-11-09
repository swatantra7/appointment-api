class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tokens, :class_name=> "::Users::Token", dependent: :destroy
  has_many :users_slots, class_name: 'Users::Slot',dependent: :destroy

  belongs_to :role

  scope :doctors, -> { where(role_id: Role.find_by(name: 'doctor').id) }

  delegate :name, to: :role, prefix: true, allow_nil: true

  def self.current_user=(user)
    RequestStore.store[:current_user] = user
  end

  def self.current_user
    RequestStore.store[:current_user]
  end

end

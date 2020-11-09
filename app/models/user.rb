class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.current_user=(user)
    RequestStore.store[:current_user] = user
  end

  def self.current_user
    RequestStore.store[:current_user]
  end

end

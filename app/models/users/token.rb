class Users::Token < ApplicationRecord

  belongs_to :user

  def self.generate_unique_token
    token = SecureRandom.hex
    return token if Users::Token.find_by_token(token).blank?
    return generate_unique_token
  end

end

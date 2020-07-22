class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :customer

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless self.class.exists?(authentication_token: token)
    end
  end

end

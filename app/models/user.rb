# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_many :rents, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    extra = access_token.extra.raw_info
    user = User.find_by(email: data['email'])
    user ||= User.create(first_name: data['first_name'],
                         last_name: data['last_name'],
                         locale: extra['locale'].split('-')[0],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20])
    user
  end
end

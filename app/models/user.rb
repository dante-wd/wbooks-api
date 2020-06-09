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
    puts "access token data"
    pp access_token
    puts "access token data end"
    puts "aca esta la data de google"
    pp data
    puts "aca termina la data de google"
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        first_name: data['first_name'],
        last_name: data['last_name'],
        locale: extra['locale'].split("-")[0],
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
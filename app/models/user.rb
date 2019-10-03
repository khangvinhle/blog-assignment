class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  validates :email, uniqueness: true

  def self.new_with_session(params, session)
    super.tap do |user|
      if session['devise.facebook_data'].present? && session['devise.facebook_data']['extra']['raw_info'].present?
        user.email = session['devise.facebook_data']['extra']['raw_info']['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    user = find_by(email: auth.info.email)
    if user.present?
      user.update(provider: auth.provider, uid: auth.uid)
    else
      user = create do |u|
        u.provider = auth.provider
        u.uid = auth.uid
        u.email = auth.info.email
        u.password = Devise.friendly_token[0, 20]
      end
    end
    user
  end
end

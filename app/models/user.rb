class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  validates :email, uniqueness: true

  def self.new_with_session(params, session)
    super.tap do |user|
      if session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = session['devise.facebook_data']['extra']['raw_info']['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    # end
    if where(email: auth.info.email).exists?
      byebug
      return_user = find_by(email: auth.info.email)
      # return_user.provider = auth.provider
      # return_user.uid = auth.uid
      return_user.update_attributes(provider: auth.provider, uid: auth.uid)
    else
      byebug
      return_user = create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
      end
    end
    return_user
  end
end

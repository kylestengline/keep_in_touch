class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
          #set omniauth providers ^

  has_many :contacts

  # need this for method in omniauth callbacks controller
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
        u.email = auth.info.email
        u.password = Devise.friendly_token[0, 20]
        u.fullname = auth.info.name
        #implement when we add images 12/9/2016
        #u.image = auth.info.image
      end #end do
    end #end if
  end # end method

  #copies the facebook email if available
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
  #reference the above here
  #https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview

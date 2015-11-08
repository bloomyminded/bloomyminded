class User < ActiveRecord::Base
  after_initialize :set_default_role, :if => :new_record?

  rolify 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]

  acts_as_tagger

	def self.from_omniauth(auth)  
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
		end
	end

  private

  def set_default_role
    self.add_role :user

    if self.email == "codyjroberts@gmail.com"
      self.add_role :admin
    end
  end
end

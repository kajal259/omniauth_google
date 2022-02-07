class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable , omniauth_providers: [:google_oauth2, :facebook, :github, :linkedin, :discord]


  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

	# 	# Uncomment the section below if you want users to be created if they don't exist
	# 	# unless user
	# 	#     user = User.create(name: data['name'],
	# 	#        email: data['email'],
	# 	#        password: Devise.friendly_token[0,20]
	# 	#     )
	# 	# end
	# 	user
	# end
	# def self.create_from_provider_data(provider_data)
	# 	where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
	# 		user.email = provider_data.info.email
	# 		user.password = Devise.friendly_token[0, 20]
	# 	end
	# end


	def self.from_omniauth(access_token)
		data = access_token.info
		user = User.where(email: data['email']).first
		unless user
			user = User.create(
				email: data['email'],
				password: Devise.friendly_token[0, 20]
			)
		end 
		user
	end
end

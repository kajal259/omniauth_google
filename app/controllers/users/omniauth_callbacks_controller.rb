class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # def all
  #   user = User.from_omniauth(request.env["omniauth.auth"])
  #   if user.persisted?
  #     session[:user_id] = user.id
  #     sign_in_and_redirect user, notice: "signed_in!"
  #   else
  #     session["devise.user_attributes"] = "user.attributes"
  #     redirect_to_new_user_registration_url(:callback => "twitter")
  #   end
  # end

  # alise_method :google_oauth2, :all
  # alise_method :facebook, :all

  def handle_auth(kind)
  @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'kind'
      sign_in_and_redirect @user, event: :authentication
      # set_flash_message(:notice, :success, :kind: 'Facebook')if is_navigational_format?
    else
      seesion['devise.auth_data'] = request.env['omniauth.auth'].except('extra')
      # flash[:error] = "There was a problem signing you in. please register or try signing letter"
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def github
    handle_auth "Github"
  end

  def google_oauth2
    handle_auth "Google_oauth2"
  end

  def facebook
    handle_auth "Facebook"
  end

  def linkedin
    handle_auth "Linkedin"
  end

  def discord
    handle_auth "Discord"   
  end

    # def github
    # @user = User.create_from_provider_data(request.env['omniauth.auth'])
    #   if @user.persisted?

    #     sign_in_and_redirect @user
    #     # set_flash_message(:notice, :success, :kind: 'Facebook')if is_navigational_format?
    #   else
    #     flash[:error] = "There was a problem signing you in. please register or try signing letter"
    #     redirect_to new_user_registration_url
    #   end
    # end
	# def google_oauth2
	# 	p "+"
  #     # You need to implement the method below in your model (e.g. app/models/user.rb)
	# 	@user = User.from_omniauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
  #     redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #   end
  # end
  # def facebook
  #   @user = User.from_omniauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Facebook'
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session['devise.facebook_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
  #     redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #   end
  # end



	def failure
		flash[:error] = 'There was a problem signing you in. please register or try signing letter'
		redirect_to new_user_registration_url
	end

end 
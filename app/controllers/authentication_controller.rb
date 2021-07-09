class AuthenticationController < ApplicationController
  def authenticate_user
    @user = User.find_for_database_authentication(email: params[:email])
    if @user.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { 
        token: token, 
        exp: time.strftime("%m-%d-%Y %H:%M"), 
        username: @user.email 
      }, 
      status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
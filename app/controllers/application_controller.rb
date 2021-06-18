class ApplicationController < ActionController::Base
  attr_reader :current_user
  skip_before_action :verify_authenticity_token 
  protected
  def authenticate_request!
    @current_user ||= User.find(auth_token[:user_id]) if auth_token
    if(!@current_user)
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  end

  private
  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  #def user_id_in_token?
  #  http_token && auth_token && auth_token[:user_id].to_i
  #end
end
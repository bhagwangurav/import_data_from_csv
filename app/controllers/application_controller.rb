class ApplicationController < ActionController::Base
  attr_reader :current_user
  skip_before_action :verify_authenticity_token 
  protected
  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end  

  def user_id_in_token?
    puts "AAA"
    puts http_token
    puts auth_token
    puts "BBB"
    http_token && auth_token && auth_token[:user_id].to_i
  end

  private
  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
      puts "======="
      puts @http_token
      puts "======="
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
    puts "-----------"
    puts @auth_token
    puts "----------------"
  end
end
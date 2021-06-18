class HomeController < ApplicationController
  before_action :authorize_request

  #For testing purpose
  def index
    render json: {'logged_in' => true}
  end
end
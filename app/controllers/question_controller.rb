class QuestionController < ApplicationController
  #before_action :authenticate_request!

  def index
    @questions = Question.all.paginate(page: params[:page], per_page: 10).order("#{params[:sort_with]} #{params[:order_by]}")
    render json: { "status" => 200, 'response' => @questions}
  end

  #import data from csv to db
  def import
    puts params[:file]
    Question.import(params[:file])
    render json: { "status" => 200, 'response' => "CSV imported succesfully"}
  end
end
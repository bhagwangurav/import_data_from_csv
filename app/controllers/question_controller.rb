class QuestionController < ApplicationController
  #before_action :authenticate_request!

  def index
    @questions = Question.all
    render json: { "status" => 200, 'response' => @questions}
  end

  #import data from csv to db
  def import
    puts params[:file]
    Question.import(params[:file])
    render json: { "status" => 200, 'response' => "CSV imported succesfully"}
  end
end
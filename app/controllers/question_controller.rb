class QuestionController < ApplicationController
  before_action :authenticate_request!

  def index
    #@questions = Question.all.paginate(page: params[:page], per_page: 10).order("#{params[:sort_with]} #{params[:order_by]}")
    #@questions = Question.joins(:mapping, :role)
    @questions = Question.select("questions.id, questions.pri, questions.name, teaming_stages.name as teaming_stages_name, questions.appears, questions.frequency, questions.q_type, roles.name as role_name, questions.required, questions.conditions, mappings.name as mapping_name").joins(:mapping, :role, :teaming_stage)
    render json: { "status" => 200, 'response' => @questions}
  end

  #import data from csv to db
  def import
    puts params[:file]
    Question.import(params[:file])
    render json: { "status" => 200, 'response' => "CSV imported succesfully"}
  end
end
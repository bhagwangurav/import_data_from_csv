class QuestionController < ApplicationController
  before_action :authorize_request

  #Show data
  def index
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
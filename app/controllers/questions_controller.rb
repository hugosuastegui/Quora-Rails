class QuestionsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index
    @all_questions = Question.all
  end

  def create
    title = params[:question_title]
    description = params[:question_description]
    question = Question.create(title: title, description: description, users_id: session[:id])
    redirect_to root_path
  end



end

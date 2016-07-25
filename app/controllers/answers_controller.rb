class AnswersController < ApplicationController

  skip_before_filter :verify_authenticity_token
  def index
    # Recordar que esto lleva a la vista index de answers
  end

  def create
    description = params[:answer_description]
    question_id = params[:question_id]
    puts description
    puts question_id
    answer = Answer.create(description: description, users_id: session[:id], questions_id: question_id)
    redirect_to root_path
  end

  def upvote
    request.xhr?
    question_id = params[:q_id]
    question_id.class
    question =  Question.find(question_id)
    votes = question.votes + 1
    question.update(votes: votes)
    total_votes = question.votes
    total_votes.to_s
  end

end

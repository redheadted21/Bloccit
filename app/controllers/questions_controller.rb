class QuestionsController < ApplicationController
  def index
    @questions = Question.all

  end

  def show


  end

  def new

    @question = Question.new

  end

  def create

    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]

 # #10
    if @question.save
 # #11
      flash[:notice] = "Post was saved successfully."
      redirect_to @question
    else
 # #12
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end

  end

  def edit
  end
end

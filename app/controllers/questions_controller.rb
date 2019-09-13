class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      # もう一回newのパスに
    end
  end

  def index
    @questions = Question.all
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def show
    @question = Question.find(params[:id])
  end

  private

    def question_params
      params.require(:question).permit(
        :title,
        :q_body
        )
    end
end

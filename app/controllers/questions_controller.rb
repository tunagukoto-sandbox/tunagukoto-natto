class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if params[:type] == "student"
        @question.student_id = params[:his_id].to_i
    elsif params[:type] == "corporation"
        @question.corporation_id = params[:his_id].to_i
    end

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
        :q_body,
        :student_id,
        :corporation_id
        )
    end
end

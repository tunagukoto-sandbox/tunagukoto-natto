class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if params[:type] == "student"
        @question.student_id = params[:his_id].to_i
        # student = current_student
        # student.set_name("ごんざ")
        # binding.pry
    elsif params[:type] == "corporation"
        @question.corporation_id = params[:his_id].to_i
    end

    if @question.save
      redirect_to root_path
    else
      redirect_to new_question_path
    end
  end

  def index
    @questions = Question.all
  end

  def destroy
    @question = Question.find(params[:id])
    @comments = Comment.where(question_id: @question.id)
    @comments.destroy_all
    @question.delete
    redirect_to root_path
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save?
      redirect_to  edit_question_path(@question.id)
    else
      redirect_to root_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @ok = false
    if @question.student_id != nil
      @img = Student.find(@question.student_id).my_image
      @ok = true
    else @question.corporation_id != nil
      @ok = false
    end
    @comments = @question.comments
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

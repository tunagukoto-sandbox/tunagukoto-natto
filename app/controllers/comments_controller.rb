class CommentsController < ApplicationController
  before_action :authenticate_any!
  def new
    @comment = Comment.new
    @question = Question.find(params[:question_id])
  end

  def create
      @comment = Comment.new(comment_params)

      @comment.question_id = params[:question_id]

      if params[:type] == "student"
        @comment.student_id = params[:his_id].to_i
      elsif params[:type] == "corporation"
        @comment.corporation_id = params[:his_id].to_i
      end

      if @comment.save

        redirect_to root_path
      else
        redirect_to  new_question_comment_path(question_id: params[:question_id])
      end

  end

  def index
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  private 


    def comment_params
      params.require(:comment).permit(
        :c_body,
        :question_id,
        :company_id,
        :student_id
        )
    end
end

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @question = Question.find(params[:question_id])
  end

  def create
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

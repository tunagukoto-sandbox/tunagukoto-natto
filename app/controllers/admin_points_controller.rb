class AdminPointsController < ApplicationController
  def new
  	@admin_point = AdminPoint.new
  end

  def create
  	id = params[:student_page_id]
  	@admin_point = AdminPoint.new(admin_point_params)
  	@admin_point.student_id = id
  	move_score = @admin_point.change_value
  	if move_score < 0
  		# @admin_point.change_value = -move_score
  		move_score = -move_score
  	end
  	if params[:admin_point][:add_or_take] == "take"
		@admin_point.change_value = -1*move_score
  	elsif params[:admin_point][:add_or_take] == "add"
  		#そのまま
  		@admin_point.change_value = move_score
  	else
  	end

  	if @admin_point.save
  	Point.update_point(id, @admin_point.change_value)
  	redirect_to root_path
  	else
  	end
  end

  def edit
  end

  def update
  end

  private

  def admin_point_params
  	params.require(:admin_point)
      .permit(
        :student_id,
        :change_value,
        :add_or_take,
        :reason
        )
  end
end

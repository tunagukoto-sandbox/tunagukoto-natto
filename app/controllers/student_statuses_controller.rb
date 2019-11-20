class StudentStatusesController < ApplicationController

  def update
  	@status = StudentStatus.find(params[:id])
  	@status.update(status_params)
  	if @status.save
  		redirect_to root_path
  	else
  		redirect_to root_path
  	end
  end

  def edit
  	@status = StudentStatus.where(student_id: params[:id]).first
  	if @status  == nil
  		@status = StudentStatus.new(
        student_id: params[:id],
        gold: false,
        silver: true,
        normal: true,
        ambassador: false,
        start_up: false
        )
        @status.save
	  end
  end

  private

    def status_params
        params.require(:student_status).permit(
        	:student_id,
          :gold,
   		:silver,
          :normal,
          :ambassador,
          :start_up
          )
    end
end

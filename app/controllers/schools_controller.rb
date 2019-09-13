class SchoolsController < ApplicationController
  def new
    @schools = School.all
  	@school = School.new
  end

  def create
  	@school = School.new(school_params)
  	if @school.save 
  		redirect_to home_admin_top_path
  	else
  		redirect_to new_school_path
  	end
  end

  def index
  end

  def destroy
  	@school = School.find(params[:id])
  	@school.destroy
  	redirect_to home_admin_top_path
  end

  private

  def school_params
     params.require(:school).permit(
        :school_name)
  end
end

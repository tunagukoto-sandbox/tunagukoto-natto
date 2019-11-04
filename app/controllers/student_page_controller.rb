class StudentPageController < ApplicationController

	def show
	    @student = Student.find(params[:id])
	end

	def index
	    @students = Student.all 
	end
	
end

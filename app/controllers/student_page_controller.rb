class StudentPageController < ApplicationController
	def show
	    if News.count >= 3
	      @news = News.first(3)
	    else
	      @news = News.all
	    end
	    @student = Student.find(params[:id])
	end

	def index
	    if News.count >= 3
	      @news = News.first(3)
	    else
	      @news = News.all
	    end
	    @students = Student.all 
	end

	def student_event
	    if News.count >= 3
	      @news = News.first(3)
	    else
	      @news = News.all
	    end
	    # Student.includes(:student_status).where(student_statuses: {gold: true})
	    event_customers = EventCustomer.where(student_id: params[:id])
	    @event_array = []
	    event_customers.each do |e|
	    	@event_array << Event.find(e.event_id)
	    end

		@events = EventCustomer.includes(:event).where(events: {finish: false}).where(student_id: current_student.id)
		@mini_events = MiniEventCustomer.where(student_id: current_student.id).where(finish: false)
	end
	
end

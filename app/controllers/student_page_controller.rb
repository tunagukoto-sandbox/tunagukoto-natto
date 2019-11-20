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

	    # 申し込み中のイベント
	    event_customers = EventCustomer.where(student_id: params[:id])
	    @event_array = []
	    event_customers.each do |e|
	    	event = Event.where(id: e.event_id, finish: false)
	    	if event.length != 0
	    		@event_array << event.first
	    	end
	    end
	    # 申し込み中のミニイベント
	    mini_event_customers = MiniEventCustomer.where(student_id: params[:id])
	    @mini_event_array = []
	    mini_event_customers.each do |me|
	    	mini_event = MiniEvent.where(id: me.mini_event_id, finish: false)
	    	if mini_event.length != 0
	    		@mini_event_array << mini_event.first
	    	end
	    end
	end
	
end

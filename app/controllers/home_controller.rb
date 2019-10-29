class HomeController < ApplicationController
  def top
    @events = Event.all

    # @first_event = Event.first
    # e_count = Event.count

    # if e_count >= 2
    #   @event_left = Event.last(e_count-1)
    # else 
    #   @event_left = nil
    # end
    
    @quests = Quest.all
    @s_count = Student.count
    if Question.count < 4
      @questions = Question.all
    else 
      @questions = Question.last(3)
    end
  	# @busi_cons = BusinessContest.all
  end

  def admin_top
  	@events = Event.all
  	@quests = Quest.all
  	# @busi_cons = BusinessContest.all
  	@schools = School.all
  end

  def admin_event
    @events = Event.all
    @hash = {}
    Event.all.each do |e|
      @hash.merge!(e.event_name => EventCustomer.where(event_id: e.id))
    end
  end

  def policy
  end

  def privacy
  end
end

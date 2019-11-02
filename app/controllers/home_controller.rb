class HomeController < ApplicationController
  def top
    @events = Event.where(finish: false)
    @e_count = Event.where(finish: true).count - 1

    @show_mini_events = MiniEvent.where(open: true)
    
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

  def admin_mini_event
    @mini_events = MiniEvent.all
    @hash = {}
    MiniEvent.all.each do |me|
      @hash.merge!(me.title => MiniEventCustomer.where(mini_event_id: me.id))
    end 
  end

  def natto
  end

  def others
  end
  
  def policy
  end

  def privacy
  end
end

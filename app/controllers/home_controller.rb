class HomeController < ApplicationController
  def top
    @events = Event.where(finish: false)

    @e_count = Event.where(finish: false).count - 1

    # @show_mini_events = MiniEvent.where(open: true)
    @show_mini_events = MiniEvent.where(open: true).where(finish: false)
    if News.count >= 3
      @news = News.first(3)
    else
      @news = News.all
    end
    
    @quests = Quest.all
    @s_count = Student.count
    if Question.count < 4
      @questions = Question.all
    else 
      @questions = Question.last(3)
    end
  end

  def admin_top
    @events = Event.all
  	@quests = Quest.all
  	@schools = School.all
  end

  def admin_event
    #終了したイベントはDBにはあるが表示はしない
    @events = Event.where(finish: false)
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

  def event_send_mail
    @event_customers = EventCustomer.where(event_id: params[:id])
    adresses = []
    @event_customers.each do |ec|
      adresses.push(ec.email)
      @event = ec.event
    end
    NotificationMailer.event_send_mail_to_customers(adresses, @event, @event_customers).deliver
  end

  def mini_event_send_mail
    @mini_event_customers = MiniEventCustomer.where(mini_event_id: params[:id])
    adresses = []
    @mini_event_customers.each do |mec|
      adresses.push(mec.email)
      @mini_event = mec.mini_event
    end
    NotificationMailer.mini_event_send_mail_to_customers(adresses, @mini_event, @mini_event_customers).deliver
  end

  def studey_event
    @events = Event.includes(:styles).where(styles: {uuid: 1}).where(finish: false)
    @mini_events = MiniEvent.includes(:styles).where(styles: {uuid: 1}).where(finish: false)
  end

  def interact_event
    @events = Event.includes(:styles).where(styles: {uuid: 2}).where(finish: false)
    @mini_events = MiniEvent.includes(:styles).where(styles: {uuid: 2}).where(finish: false)
  end

  def natto
  end

  def others
  end
  
  def policy
  end

  def privacy
  end

  def comming_soon
  end

  def registrations
  end
end

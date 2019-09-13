class HomeController < ApplicationController
  def top
  	@events = Event.all
  	@quests = Quest.all
  	# @busi_cons = BusinessContest.all
  end

  def admin_top
  	@events = Event.all
  	@quests = Quest.all
  	# @busi_cons = BusinessContest.all
  	@schools = School.all
  end

  def policy
  end
end

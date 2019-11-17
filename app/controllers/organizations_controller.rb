class OrganizationsController < ApplicationController
  def student_group
    if News.count >= 3
      @news = News.first(3)
    else
      @news = News.all
    end
  	@student_groups = StudentGroup.all
  end

  def non_profit
    if News.count >= 3
      @news = News.first(3)
    else
      @news = News.all
    end
  	@npos = NonProfitOrganization.all
  end
end

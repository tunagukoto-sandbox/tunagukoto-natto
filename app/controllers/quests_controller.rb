class QuestsController < ApplicationController
before_action :authenticate_any!
  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      @quest.uuid = create_uuid(@quest)
      @quest.save
      redirect_to home_admin_top_path
    else
      redirect_to new_business_contest
    end
  end

  def index
    @quests = Quest.all
  end

  def show
    @quest = Quest.find(params[:id])
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.delete
    redirect_to root_path
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:id])
    @quest.update(quest_params)
    if @quest.save 
      redirect_to home_admin_top_path
    else
      redirect_to edit_quest(params[:id])
    end
  end

  private 

    def quest_params
      params.require(:quest).permit(
        :company_name,
        :uuid,
        :title,
        :description,
        :gift,
        :gift_detail,
        :dead_line,
        :dead_line_detail,
        :company_logo, # 会社のロゴ
        :quest_image  # クエストの詳細の部分の写真
        )
    end

    def create_uuid(quest)

      id = quest.id.to_s.length

      if id > 7
        uuid = "Q" + @quest.id.to_s
      else
        zeros = "0"*(7-id)
        uuid = "Q" + zeros + @quest.id.to_s
      end

      return uuid
    end
end

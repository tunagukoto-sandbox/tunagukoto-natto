class EventApplyTagController < ApplicationController
  def edit
  end

  def update
  	@event_apply_tag = EventApplyTag.find(params[:id])
  	if params[:pay_method] == "cash"
  		@event_apply_tag.has_paid = true
  		@event_apply_tag.pay_cash = true
  		@event_apply_tag.save
  		redirect_to home_admin_event_path
  	elsif params[:pay_method] == "point"
  		@event_apply_tag.has_paid = true
  		@event_apply_tag.pay_point = true
  		@event_apply_tag.save
  		redirect_to home_admin_event_path
  		#ポイントがあるか？確認
  		# なかったら作成
  		#TODO ポイントの計算
  		# ポイントがなければ、現金で支払い

  	end	
  end

  private

  def event_applay_tag_params
     params.require(:event_apply_tag).permit(
        :event_id,
        :student_id,
        :has_paid,
        :pay_point,
        :pay_cash
        )
  end
end

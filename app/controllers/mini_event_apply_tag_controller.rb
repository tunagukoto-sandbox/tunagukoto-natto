class MiniEventApplyTagController < ApplicationController
  def update
  	@mini_event_apply_tag = MiniEventApplyTag.find(params[:id])
    mini_event = MiniEvent.find(@mini_event_apply_tag.mini_event_id)
    if mini_event.pay_point.nil?
    	mini_event.pay_point = 0
    	mini_event.save
    end
    student = Student.find(@mini_event_apply_tag.student_id)
  	if params[:pay_method] == "cash"
  		@mini_event_apply_tag.has_paid = true
  		@mini_event_apply_tag.pay_cash = true
  		@mini_event_apply_tag.save
  		redirect_to home_admin_mini_event_path
  	elsif params[:pay_method] == "point"
      point = student.point
      # ポイント条件分岐
      if point.having_point >= mini_event.pay_point
      	#支払い済みにする
  		@mini_event_apply_tag.has_paid = true
  		@mini_event_apply_tag.pay_point = true
  		@mini_event_apply_tag.save
  		# ポイントの計算をする
        point.having_point = point.having_point - mini_event.pay_point
        point.save
        redirect_to home_admin_mini_event_path
        # alarmからsuccessに変更
        flash[:alarm] = "ポイントで参加費を払いました"
      else
        # 現金でのお支払い
        redirect_to home_admin_mini_event_path
        flash[:alarm] = "ポイントが足りていません、現金でお支払いください。"
      end	

  	end	
  end

  private

  def event_applay_tag_params
     params.require(:event_apply_tag).permit(
        :mini_event_id,
        :student_id,
        :has_paid,
        :pay_point,
        :pay_cash
        )
  end
end

class EventApplyTagController < ApplicationController
  def edit
  end

  def update
  	@event_apply_tag = EventApplyTag.find(params[:id])
    event = Event.find(@event_apply_tag.event_id)
    student = Student.find(@event_apply_tag.student_id)
  	if params[:pay_method] == "cash"
  		@event_apply_tag.has_paid = true
  		@event_apply_tag.pay_cash = true
  		@event_apply_tag.save
  		redirect_to home_admin_event_path
  	elsif params[:pay_method] == "point"
  		@event_apply_tag.has_paid = true
  		@event_apply_tag.pay_point = true
  		@event_apply_tag.save
      point = student.point
      if point == nil
        point = Point.new(
          student_id: student.id,
          student_name: student.first_name+ student.last_name,
          max_point: 0,
          having_point: 0
        )
      end
      if point.having_point >= event.pay_point
        point.having_point = point.having_point - event.pay_point
        point.save
        redirect_to home_admin_event_path
        flash[:succece] = "ポイントで参加費を払いました"
      else
        # 現金でのお支払い
        redirect_to home_admin_event_path
        flash[:alarm] = "ポイントが足りていません、現金でお支払いください。"
      end	
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

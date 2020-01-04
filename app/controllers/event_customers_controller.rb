class EventCustomersController < ApplicationController
  # before_action :authenticate_any!, :new
  before_action :authenticate_student!, :new
  def new
  	@event_customer = EventCustomer.new
    @event = Event.find(params[:event_id])
  end

  def create
  	@event_customer = EventCustomer.new
    @event_customer.email = current_student.email
    @event_customer.school_id = current_student.school.id
    @event_customer.name = current_student.first_name + current_student.last_name
    @event_customer.event_id = params[:event_id]
    @event_customer.student_id = current_student.id
    @event_customer.check = false


      if params[:pay_way] == "point"
        if !current_student.point.nil?
          if current_student.point.having_point >= @event_customer.event.pay_point
            current_student.point.having_point = current_student.point.having_point - @event_customer.event.pay_point
            EventApplyTag.create(
              student_id: current_student.id, 
              event_id: @event_customer.event_id,
              has_paid: true,
              pay_point: true,
              pay_cash: false
              )
          else
            EventApplyTag.create(
              student_id: current_student.id, 
              event_id: @event_customer.event_id,
              has_paid: false,
              pay_point: false,
              pay_cash: false
              )
          end
        else
          @point = Point.new(
            student_id: current_student.id,
            student_name: "#{current_student.first_name}" + "#{current_student.last_name}",
            max_point: 0,
            having_point: 0 
            )
        end
      elsif params[:pay_way] == "cash" || params[:pay_way].nil?
        EventApplyTag.create(
          student_id: current_student.id, 
          event_id: @event_customer.event_id,
          has_paid: false,
          pay_point: false,
          pay_cash: false
        )
      end

  	if @event_customer.save
      NotificationMailer.event_send_confirm_to(@event_customer).deliver
      redirect_to home_all_event_apply_complete_path
  	else
  		redirect_to  new_event_event_customer_path(event_id: @event_customer.event_id)
  	end
  end

  def destroy
    @event_customer = EventCustomer.find(params[:id])
    @event_customer.delete
    redirect_to home_admin_event_path
  end

  def edit
    @event_customer = EventCustomer.find(params[:id])
  end

  def update
    @event_customer = EventCustomer.find(params[:id])
    @event_customer.update(event_customer_params)
    if @event_customer.save
      redirect_to home_admin_top_path
    else
      redirect_to edit_event_customer_path(@event_customer.id)
    end
  end
  
  private 

	def event_customer_params
	  	params.require(:event_customer)
	  	.permit(
          :student_id,
          :check,
	        :email,
	        :name,
	        :school_id,
	        :event_id,
	        :tel
        )
	end
end

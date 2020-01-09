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
    # check はイベントに来た時にtrueをつける。出席がわり
    @event_customer.check = false

    if @event_customer.save
      EventApplyTag.create(
              event_customer_id: @event_customer.id,
              student_id: current_student.id, 
              event_id: @event_customer.event_id,
              has_paid: true,
              pay_point: false,
              pay_cash: false
      )
      NotificationMailer.event_send_confirm_to(@event_customer).deliver
      redirect_to home_all_event_apply_complete_path
  	else
  		redirect_to  new_event_event_customer_path(event_id: @event_customer.event_id)
  	end
  end

  def destroy
    @event_customer = EventCustomer.find(params[:id])
    if !@event_customer.event_apply_tag.nil?
      @event_customer.event_apply_tag.delete
    end
    @event_customer.delete
    if student_signed_in?
      redirect_to student_event_page_path(id: current_student.id)
    else
      redirect_to root_path
    end
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

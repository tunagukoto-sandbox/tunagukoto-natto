class EventCustomersController < ApplicationController
  def new
  	@event_customer = EventCustomer.new
  end

  def create
  	@event_customer = EventCustomer.new(event_customer_params)
    if student_signed_in?
      @event_customer.student_id = current_student.id
      @event_customer.check = false
    end
    binding.pry
  	if @event_customer.save
  		redirect_to root_path
  	else
  		redirect_to new_event_customer_path
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

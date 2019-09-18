class EventCustomersController < ApplicationController
  def new
  	@event_customer = EventCustomer.new
  end

  def create
  	@event_customer = EventCustomer.new(event_customer_params)
  	if @event_customer.save
  		redirect_to root_path
  	else
  		redirect_to new_event_customer_path
  	end
  end

  def destroy
  end

  private 
	def event_customer_params
	  	params.require(:event_customer)
	  	.permit(
	        :email,
	        :name,
	        :school_id,
	        :event_id,
	        :tel
        )
	end
end

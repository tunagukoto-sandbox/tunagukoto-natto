class MiniEventCustomersController < ApplicationController
  def new
    @mini_event_customer = MiniEventCustomer.new
  end

  def create
    @mini_event_customer = MiniEventCustomer.new(mini_event_customer_params)
    if student_signed_in?
      @mini_event_customer.student_id = current_student.id
    end
    if @mini_event_customer.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def mini_event_customer_params
      params.require(:mini_event_customer)
      .permit(
        :mini_event_id,
        :student_id,
        :school_id,
        :name,
        :email,
        :phone_num
        )
  end
  
end

class MiniEventCustomersController < ApplicationController
  # before_action :authenticate_any!, :new
  before_action :authenticate_student!, :new
  def new
    if current_student.point.nil?
      Point.create(
        student_id: current_student.id,
        student_name: "#{current_student.first_name}" + "#{current_student.last_name}",
        max_point: 0,
        having_point: 0 
        )
      redirect_to new_mini_event_mini_event_customer_path(mini_event_i: params[:mini_event_i])
    end
    @mini_event_customer = MiniEventCustomer.new
    @mini_event = MiniEvent.find(params[:mini_event_id])
  end

  def create
    @mini_event = MiniEvent.find(params[:mini_event_id])
    student = current_student
    @mini_event_customer = MiniEventCustomer.new

    @mini_event_customer.mini_event_id = params[:mini_event_id]
    @mini_event_customer.student_id = student.id
    @mini_event_customer.school_id = student.school.id
    @mini_event_customer.email = student.email
    @mini_event_customer.name = student.first_name + student.last_name

    if @mini_event_customer.save

      if params[:pay_way] == "point"
          current_student.point.having_point = current_student.point.having_point - @mini_event_customer.mini_event.pay_point
          current_student.point.save
          MiniEventApplyTag.create(
            mini_event_customer_id: @mini_event_customer.id,
            mini_event_id: @mini_event_customer.mini_event_id,
            student_id: current_student.id,
            has_paid: true,
            pay_point: true,
            pay_cash: false
          )
      elsif params[:pay_way] == "cash"|| params[:pay_way].nil?
          MiniEventApplyTag.create( 
            mini_event_customer_id: @mini_event_customer.id,           
            mini_event_id: @mini_event_customer.mini_event_id,
            student_id: current_student.id,
            has_paid: false,
            pay_point: false,
            pay_cash: false
          )
      end
      NotificationMailer.mini_event_send_confirm_to(@mini_event_customer).deliver
      redirect_to home_all_event_apply_complete_path
    else
      redirect_to root_path
    end

  end

  def edit
  end

  def update
  end

  def destroy
    @mini_event_customer = MiniEventCustomer.find(params[:id])
    if !@mini_event_customer.mini_event_apply_tag.nil?
      @mini_event_customer.mini_event_apply_tag.delete
    end
    @mini_event_customer.delete
    if student_signed_in?
      redirect_to student_page_path(current_student.id)
    else
      redirect_to root_path
    end
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

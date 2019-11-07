class NotificationMailer < ActionMailer::Base
  default from: "hogehoge@example.com"

    def event_send_confirm_to(event_customer)
      @customer = event_customer

      @event = @customer.event
      @tag = @event.tag.tag_name
      mail(
        subject: "#{@tag}の参加お申し込み",
        to: @customer.email
      ) do |format|
        format.text
      end
    end


  def mini_event_send_confirm_to(mini_event_customer)
    @customer = mini_event_customer
    @mini_event = @customer.mini_event

    if @customer.student_id != nil
      student = Student.find(@customer.student_id)
      @held = student.first_name + student.last_name
    elsif @customer.corporation_id != nil
      corporation = Corporation.find(@customer.corporation_id)
      @held = corporation.name
    end
    mail(
      subject: "#{@mini_event.mini_event_name}の参加お申し込み",
      to: @customer.email
    ) do |format|
      format.text
    end
  end

end


  # def mini_event_customer_params
  #     params.require(:mini_event_customer)
  #     .permit(
  #       :mini_event_id,
  #       :student_id,
  #       :school_id,
  #       :name,
  #       :email,
  #       :phone_num
  #       )
  # end

  #   belongs_to :school
  # belongs_to :mini_event

    # :title,
    # :mini_event_img,
    # :student_id,
    # :corporation_id,
    # :detail,
    # :time,
    # :time_detail,
    # :cost,
    # :requirement,
    # :get_point,
    # :pay_point,
    # :locate,
    # :invite_num,
    # :mini_event_name,
    # :free_box,
    # :open

class NotificationMailer < ActionMailer::Base
  default from: "hogehoge@example.com"

  def send_confirm_to(event_customer)
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
end


  # def event_customer_params
  #     params.require(:event_customer)
  #     .permit(
  #         :student_id,
  #         :check,
  #         :email,
  #         :name,
  #         :school_id,
  #         :event_id,
  #         :tel
  #       )
  # end
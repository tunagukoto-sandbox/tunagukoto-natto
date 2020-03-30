class NotificationMailer < ActionMailer::Base
  # default from: "hogehoge@example.com"

  default from: "info@tunagu.or.jp"

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

  def event_send_mail_to_customers(adresses, event, event_customers)
    @event = event
    @event_customers = event_customers
    mail(
      subject: "#{@event.event_select}についてのご連絡",
      bcc: adresses
    )
  end

  def mini_event_send_mail_to_customers(adresses, mini_event, mini_event_customers)
    @mini_event = mini_event
    @mini_event_customers = mini_event_customers
    if @mini_event.student_id != nil
      @name = "#{@mini_event.student.first_name}" + "#{@mini_event.student.last_name}"
      @ok = true
    end
    mail(
      subject: "#{@mini_event.mini_event_name}についてのご連絡",
      bcc: adresses
    )
  end

end

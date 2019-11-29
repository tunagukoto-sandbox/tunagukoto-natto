class PointsController < ApplicationController

  def rollback_point
    @mini_event_customer = MiniEventCustomer.find(params[:id])
    @mini_event = MiniEvent.find(@mini_event_customer.mini_event_id)
    @point = Point.where(student_id: @mini_event_customer.student_id).first

    if @mini_event.get_point != nil
      if @point.having_point == @point.max_point
        @point.max_point -= @mini_event.get_point
      end
      @point.having_point -= @mini_event.get_point
    end
    
    # 消費ポイント処理は申し込み時に発火
    # if @mini_event.pay_point != nil
    #   @point.having_point += @mini_event.pay_point
    # end

    @mini_event_customer.check = false
    @mini_event_customer.save
    if @point.save
      redirect_to home_admin_mini_event_path
    else
      redirect_to root_path
    end
  end

  def update_point
    @mini_event_customer = MiniEventCustomer.find(params[:id])
    @mini_event = MiniEvent.find(@mini_event_customer.mini_event_id)
    @student = Student.find(@mini_event_customer.student_id)
    @point = Point.find_by(student_id: @mini_event_customer.student_id)
    @status = StudentStatus.find_by(student_id: @mini_event_customer.student_id)
    if @status == nil
      @status = StudentStatus.new(
        student_id: @mini_event_customer.student_id,
        gold: false,
        silver: true,
        normal: true,
        ambassador: false,
        start_up: false
        )
      @status.save
    end
    if @point == nil
      @point = Point.new(
        student_id: @mini_event_customer.student_id,
        student_name: "#{@student.first_name}" + "#{@student.last_name}",
        max_point: 0,
        having_point: 0 
        )
    end
    if @mini_event.get_point != nil
      @point.having_point += @mini_event.get_point
      @point = point_max_update(@point)
    end
    # 消費ポイント処理は申し込み時に発火
    # if @mini_event.pay_point != nil
    #   @point.having_point -= @mini_event.pay_point
    # end

    @mini_event_customer.check = true
    @mini_event_customer.save

    if @point.save
      redirect_to home_admin_mini_event_path
    else
      redirect_to root_path
    end
  end

  def update_point_event
    @event_customer = EventCustomer.find(params[:id])
    if @event_customer.student_id == nil
      redirect_to home_admin_event_path
      flash[:alarm] = "登録されていない学生です。問題が発生したため、正しく確認が取れませんでした。"
    else
      @event = Event.find(@event_customer.event_id)
      @student = Student.find(@event_customer.student_id)
      @point = Point.find_by(student_id: @student.id)
      @status = StudentStatus.find_by(student_id: @student.id)
      if @status == nil
        @status = StudentStatus.new(
          student_id: @student.id,
          gold: false,
          silver: true,
          normal: true,
          ambassador: false,
          start_up: false
          )
        @status.save
      end
      if @point == nil
        @point = Point.new(
          student_id: @student.id,
          student_name: "#{@student.first_name}" + "#{@student.last_name}",
          max_point: 0,
          having_point: 0 
          )
      end
      if @event.get_point != nil
        @point.having_point += @event.get_point
        @point = point_max_update(@point)
      end
      if @event.pay_point != nil
        @point.having_point -= @event.pay_point
      end
      @event_customer.check = true
      @event_customer.save
      if @point.save
        redirect_to home_admin_event_path
      else
        redirect_to root_path
      end
    end

  end


  def rollback_point_event
    @event_customer = EventCustomer.find(params[:id])
    @event = Event.find(@event_customer.event_id)
    @point = Point.find_by(student_id: @event_customer.student_id)

    if @event.get_point != nil
      if @point.having_point == @point.max_point
        @point.max_point -= @event.get_point
      end
      @point.having_point -= @event.get_point
    end
    if @event.pay_point != nil
      @point.having_point += @event.pay_point
    end

    @event_customer.check = false
    @event_customer.save
    if @point.save
      redirect_to home_admin_event_path
    else
      redirect_to root_path
    end
  end

  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def point_params
    params.require(:point)
      .permit(
      :student_id,
      :student_name,
      :max_point,
      :having_point
    )
  end

  def point_max_update(point)
    if point.having_point >= point.max_point
      point.max_point = point.having_point
    end
    return point
  end

end

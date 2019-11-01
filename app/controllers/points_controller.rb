class PointsController < ApplicationController

  def init(customer)
    #@students = 
    #子モデルを持っていない親モデルだけを抽出
      Point.create(
        student_id: customer.student_id,
        student_name: "#{s.first_name}" + "#{s.last_name}",
        max_point: 0,
        having_point: 0 
        )
  end


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
    if @mini_event.pay_point != nil
      @point.having_point += @mini_event.pay_point
    end

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
    @point = Point.where(student_id: @mini_event_customer.student_id).first
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
    if @mini_event.pay_point != nil
      @point.having_point -= @mini_event.pay_point
    end

    @mini_event_customer.check = true
    @mini_event_customer.save

    if @point.save
      redirect_to home_admin_mini_event_path
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

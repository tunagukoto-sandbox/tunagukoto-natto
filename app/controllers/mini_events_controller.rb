class MiniEventsController < ApplicationController
  
  def index
    @mini_events = MiniEvent.all
  end

  def new
    @mini_event = MiniEvent.new
  end

  def create
    @mini_event = MiniEvent.new(mini_event_params)
    if point_check(params[:mini_event][:pay_point], params[:mini_event][:get_point])
      @mini_event.time = time
      style_ids = params[:mini_event][:style_ids]
      @mini_event[:finish] = false
      if @mini_event.student_id != nil
        @mini_event.mini_event_name = mini_event_name(@mini_event)
      end
      if @mini_event.save
        make_relation(@mini_event, style_ids)
        redirect_to root_path
      else
        redirect_to new_mini_event_path
      end
    else
        redirect_to new_mini_event_path
        flash[:success] = '取得ポイントまたは消費ポイントが半角英数字で入力されていません、確認してください。'
    end
  end

  def point_check(get, pay)
    get_check = false
    pay_check = false
    if get =~ /^[0-9A-Za-z]+$/
      get_check = true
    end
    if pay =~ /^[0-9A-Za-z]+$/
      pay_check = true
    end
    check = get_check && pay_check
    return check
  end

  def edit
    @mini_event = MiniEvent.find(params[:id])
  end

  def update
    @mini_event = MiniEvent.find(params[:id])
    @mini_event.update(mini_event_params)
    style_ids = params[:mini_event][:style_ids]
    mini_event_style_delete_all(@mini_event.id)
    make_relation(@mini_event, style_ids)

    if @mini_event.save
      redirect_to root_path
    else
      redirect_to new_mini_event_path
    end
  end

  def show
    if News.count >= 3
      @news = News.first(3)
    else
      @news = News.all
    end
    @mini_event = MiniEvent.find(params[:id])
  end

  def destroy
    @mini_event = MiniEvent.find(params[:id])
    @mini_event_customers = MiniEventCustomer.where(mini_event_id: @mini_event.id)
    @mini_event_customers.delete_all
    mini_event_style = MiniEventStyle.where(mini_event_id: @mini_event.id)
    mini_event_style.delete_all
    @mini_event.delete
    redirect_to root_path
  end

  private

  def make_relation(mini_event, style_ids)
    if style_ids != nil
      style_ids.each do |s_id|
        MiniEventStyle.create(mini_event_id: mini_event.id, style_id: s_id.to_i)
      end
    end
  end

  def mini_event_style_delete_all(m_e_id)
    mini_event_styles = MiniEventStyle.where(mini_event_id: m_e_id)
    mini_event_styles.delete_all
  end

  def mini_event_params
    params.require(:mini_event).permit(
    :title,
    :mini_event_img,
    :student_id,
    :corporation_id,
    :detail,
    :time,
    :time_detail,
    :cost,
    :requirement,
    :get_point,
    :pay_point,
    :locate,
    :invite_num,
    :mini_event_name,
    :free_box,
    :open,
    :finish,
    :organizer
    )
  end

def time
  year = params[:mini_event]["time(1i)"].to_i
  month = params[:mini_event]["time(2i)"].to_i
  day = params[:mini_event]["time(3i)"].to_i
  return Date.new(year, month, day)
end

  def mini_event_name(event)
    if event.student_id != nil
    result = "#{event.student.first_name}" + "#{event.student.last_name}" + "【#{event.title}】"
    else
      result =  "【#{event.title}】"
    end
  
    return result 
  end
end

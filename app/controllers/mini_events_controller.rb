class MiniEventsController < ApplicationController
  def new
    @mini_event = MiniEvent.new
  end

  def create
    @mini_event = MiniEvent.new(mini_event_params)
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

  def index
    @mini_events = MiniEvent.all
  end

  def show
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
    # :mini_event_img,
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
    :finish
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

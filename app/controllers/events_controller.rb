class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.event_time = event_time
    @event.finish = false
    sub_tag_ids, sub_tag_ok = sub_tag_params
    @event.tag_id = params[:event]["tag"].to_i
    style_ids = params[:event][:style_ids]
    if @event.save
      make_relation(@event.id, sub_tag_ids, sub_tag_ok, style_ids)
      @event.event_select = event_select(@event)
      @event.save
      flash[:success] = 'イベントを新しく作成しました'
      redirect_to root_path
    else
      redirect_to new_event_path
    end

  end

  def index
    @events = Event.all
  end

  def show 
    @event = Event.find(params[:id])
    @tag = @event.tag
    @sub_tags = @event.sub_tags
  end

  def destroy
    @event = Event.find(params[:id])
    Event.delete_event(@event)
    style_events = StyleEvent.where(event_id: @event.id)
    style_events.delete_all
    @event.delete
    redirect_to root_path
  end

  def edit
     @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @event.event_time = event_time
    @event.event_select = event_select(@event)
    @event.save
    sub_tag_ids, sub_tag_ok = sub_tag_params
    @event.tag_id = params[:event]["tag"].to_i
    style_ids = params[:event][:style_ids]

    if @event.save
      event_sub_tag_delete_all(@event.id)
      event_style_delete_all(@event.id)
      make_relation(@event.id, sub_tag_ids, sub_tag_ok, style_ids)
      redirect_to root_path
    else
      redirect_to edit_event_path(@event.id)
    end

  end

  def auto_delete_event
    # 終わったイベントを自動消去する関数
    events = Event.all
    if events  != nil
      events.each do |e| 
        Event.delete_event(e) && e.delete if e.event_time + 1.day < Date.current
      end
    end
  end

  def event_style_delete_all(event_id)
    style_events = StyleEvent.where(event_id: event_id)
    style_events.delete_all
  end

  def make_relation(event_id, sub_tag_ids, sub_tag_ok, style_ids)
    if sub_tag_ok
      sub_tag_ids.each do |sub_tag_id|
        EventSubTag.create(event_id: event_id, sub_tag_id: sub_tag_id)
      end
    end
    if style_ids != nil
      style_ids.each do |s_id|
        StyleEvent.create(event_id: event_id, style_id: s_id.to_i)
      end
    end
  end

def event_time
  year = params[:event]["event_time(1i)"].to_i
  month = params[:event]["event_time(2i)"].to_i
  day = params[:event]["event_time(3i)"].to_i
  return Date.new(year, month, day)
end

  private

    def event_params_check
      # ここにバリデーションを書いて
      # eventの日時が現在より前の時刻になってないか？=>なってる場合はエラー文を返す。
      # カラムの中身が空でないか？
      # costの中身をint型に変換
      # google_form のフォーマットは正しいか？
    end


    def event_sub_tag_delete_all(event_id)
      @event_sub_tags = EventSubTag.where(event_id: event_id)
      @event_sub_tags.delete_all
    end


    def event_params
      params.require(:event)
      .permit(
        # 詳細内部
        :event_name,
        :event_title,
        # 一番上
        :event_question,
        :event_description,
        # 社長紹介
        :president_image,
        :event_company_name,
        :event_president_birth_day,
        :event_president,
        :event_motto,
        # イベント詳細
        :event_location, 
        :event_cost,
        :event_time,
        :event_time_detail,
        :event_population,
        # イベントの申し込みURL
        :google_form,
        # 詳細外部
        :event_top_image,
        :event_show_image,
        :tag_id,
        :position,
        :event_select,
        :get_point,
        :pay_point,
        :finish
        )
    end

    def event_select(event)
      event_select = "#{event.event_time.month}"+"月"+"#{event.tag.tag_name}"+"【#{event.event_company_name}】"
      return event_select
    end

    def event_top_resize
      if params[:event_top_image] != nil
        event_top_image = MiniMagick::Image.read(params[:event_top_image])
        event_top_image.resize "300x300"
        return event_top_image
      end
    end

    def event_show_resize
      if params[:event_show_image] != nil
        event_show_image = MiniMagick::Image.read(params[:event_show_image])
        event_show_image.resize "300x300"
        return event_show_image
      end
    end

    def president_resize
      if params[:president_image] != nil
        president_image = MiniMagick::Image.read(params[:president_image])
        president_image.resize "300x300"
        return president_image
      end  
    end

    def tag_params
      tag_id_array = []
      tag_ids = params.require(:event)[:tag_ids]
      ok = false
        if tag_ids != nil
          tag_ids.each do |t_id|
            tag_id_array << t_id.to_i
          end
         ok = true
        end
      return tag_id_array, ok
    end

    def sub_tag_params
      sub_tag_id_array = []
      sub_tag_ids = params.require(:event)[:sub_tag_ids]
      ok = false
      if sub_tag_ids != nil
        sub_tag_ids.each do |s_t_id|
          sub_tag_id_array << s_t_id.to_i
        end
        ok = true
      end
      return sub_tag_id_array, ok
    end

end

class NewsController < ApplicationController
  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to root_path
    else
      redirect_to new_news_path
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    @news.update(news_params)
    if @news.save
      redirect_to root_path
    else
      redirect_to edit_news_path(@news.id)
    end
  end

  def destroy
    @news = News.find(params[:id])
  end

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  private

  def news_params
    params.require(:news)
      .permit(
        :title,
        :main_body,
        :sub_body,
        :open,
        :link_url
        )
  end
end

class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_param)
    @article.event_id = params[:event_id]
    if @article.save
      redirect_to home_admin_top_path
    else
      redirect_to new_event_article_path(event_id: params[:event_id])
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def article_param
    params.require(:article).permit(
      :event_id,
      :title,
      :linked_url,
      :open
      )
  end
end

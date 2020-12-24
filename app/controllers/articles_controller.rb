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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_param)
    if @article.save
      redirect_to home_admin_top_path
    else
      redirect_to edit_article_path(id: params[:id])
    end
  end

  def show
  end

  def article_param
    params.require(:article).permit(
      :event_id,
      :title,
      :linked_url,
      :article_img,
      :open
      )
  end
end

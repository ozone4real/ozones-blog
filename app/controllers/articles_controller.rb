class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit)
  before_action :require_user, only: [:new]

  def new
    @article = Article.new
  end

  def show; end

  def edit; end

  def destroy
    @article = Article.destroy(params[:id])
    flash.now[:error] = "Article was successfully deleted"
    redirect_to articles_path
  end

  def create
    article_data = calculate_time_to_read(article_params)
    @article = Article.new(article_data)
    @article.user = current_user
    if @article.save
      flash.now[:success] = "Article was successfully created"
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    article_data = calculate_time_to_read(article_params)
    @article = Article.update(params[:id], article_data)
    if @article.save
      flash.now[:success] = "Article was successfully updated"
      redirect_to @article
    else
      render "edit"
    end
  end

  def index
    @articles = Article.all
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def calculate_time_to_read(params)
    article_words = params[:article_body].split(" ").length
    params[:time_to_read] = "#{(article_words.to_f / 200).ceil} min"
    params
  end

  def article_params
    params.require(:article).permit(:title, :article_body, :image_url)
  end
end

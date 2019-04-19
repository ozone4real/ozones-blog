class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def destroy
    @article = Article.destroy(params[:id])
    flash[:notice] = "Article was successfully created"
    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    @article = Article.update(params[:id], article_params)
    if @article.save
      flash[:notice] = "Article was successfully updated"
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

  def article_params
    params.require(:article).permit(:title, :description)
  end
end

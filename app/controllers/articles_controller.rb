class ArticlesController < ApplicationController
  def new
    
  end

  def create
    @article = Article.new(article_params)
    redirect_to @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

end

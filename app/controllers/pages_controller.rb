class PagesController < ApplicationController
  def home
    @user = User.new
    @articles = Article.all
    @random_article = @articles.sample
  end

  def about
    "hoooooooo"
  end
end

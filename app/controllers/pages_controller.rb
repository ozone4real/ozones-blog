class PagesController < ApplicationController
  def home
    @articles = Article.all
    @user = User.new
    @top_articles = @articles.sort {|a,b| b.number_of_reads <=> a.number_of_reads}
    @most_liked_articles = @articles.sort {|a,b| b.likes.length <=> a.likes.length}
  end

  def about
    "hoooooooo"
  end
end

class PagesController < ApplicationController
  def home
    @articles = Article.order(created_at: :desc).includes(:likes)
    @user = User.new
    @top_articles = @articles.sort { |a, b| b.number_of_reads <=> a.number_of_reads }
    @most_liked_articles = sort_by_likes(@articles)
    @featured_articles = @articles
    if current_user&.following.present?
      articles_by_mutual_followees = sort_by_likes(find_mutual_followees.articles).first if find_mutual_followees
      articles_by_people_you_follow = current_user.following.map(&:articles).flatten
      @articles_by_people_you_follow = (articles_by_mutual_followees ? articles_by_people_you_follow << articles_by_mutual_followees : articles_by_people_you_follow).
                                       uniq.
                                       sort { |a, b| b.created_at <=> a.created_at }.take(4)
      @featured_articles = @articles.select { |article| !@articles_by_people_you_follow.include? article}
    end
  end

  def about
    "hoooooooo"
  end

  private

  def find_mutual_followees
    followees = current_user.following.map do |followee|
      followee.following.reject { |followe| followe == current_user }
    end.flatten

    freq = followees.inject(Hash.new(0)) { |hash, val| hash[val] += 1; hash }
    followees = followees.uniq.select { |item| freq[item] > 1 }
    followees.max_by { |val| freq[val] }
  end

  def sort_by_likes(data)
    data.sort { |a, b| b.likes.length <=> a.likes.length }
  end
end

module ArticlesHelper
  def liked_by_me?(article)
    !!article.likes.find {|like| like.user == current_user }
  end
end

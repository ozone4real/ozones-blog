module ArticlesHelper
  def liked_by_me?(article)
    !!article.likes.detect { |like| like.user == current_user }
  end
end

module ApplicationHelper
  def image_url(article)
    article.image_url.present? ? article.image_url.to_s : 'Blog.jpg'
  end
end

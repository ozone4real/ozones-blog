module ArticlesHelper
  def url
    url_for(only_path: true)
  end
end

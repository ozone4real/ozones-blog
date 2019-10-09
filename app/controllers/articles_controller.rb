class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update)
  before_action :set_article_by_id, only: [:update]
  before_action :require_user, only: %i(new update edit like_article)
  before_action :require_same_user, only: %i(edit update destory)

  def new
    @article = Article.new
  end

  def show
    unless @article.user == current_user
      @article.increment!(:number_of_reads)
    end
  end

  def edit; end

  def destroy
    @article = Article.destroy(params[:slug])
    flash.now[:error] = "Article was successfully deleted"
    redirect_to profile_path
  end

  def search
    @search_results = Article.search params[:query], suggest: [:full_text]
  end

  def create
    article_data = calculate_time_to_read(article_params)
    @article = Article.new(article_data)
    @article.user = current_user
    if @article.save
      flash.now[:success] = "Article was successfully created"
      redirect_to article_path @article.slug
    else
      render "new"
    end
  end

  def update
    article_data = calculate_time_to_read(article_params)
    p article_data
    if @article.update(article_data)
      flash.now[:success] = "Article was successfully updated"
      redirect_to article_path @article.slug
    else
      render "edit"
    end
  end

  def index
    @articles = Article.all
  end

  def like_article
    return liked.destroy if liked
    @like = Like.create(user: current_user, article_id: params[:article_id])
    json_response @like.errors, 401 unless @like.save
  end

  private

  def set_article
    @article = Article.find_by(slug: params[:slug])
  end

  def set_article_by_id
    @article = Article.find(params[:id])
  end

  def calculate_time_to_read(params)
    article_words = params[:article_body].split(" ").length
    params[:time_to_read] = "#{(article_words.to_f / 200).ceil} min"
    params
  end

  def article_params
    params.require(:article).permit(:title, :article_body, :image_url, category_ids: [])
  end

  def liked
    like = Like.find_by(user: current_user, article_id: params[:article_id])
  end

  def require_same_user
    unless current_user.is_admin? || current_user.id == @article.user_id
      flash[:error] = "You did not author the article, so you can't edit or delete it"
      redirect_to root_path
    end
  end
end

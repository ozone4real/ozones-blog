class ArticlesController < ApplicationController
  before_action :set_article, only: %i(edit update)
  before_action :set_article_by_id, only: [:update]
  before_action :require_user, only: %i(new update edit like_article)
  before_action proc { require_same_user(@article) }, only: %i(edit update destory)

  def new
    @article = Article.new
  end

  def autocomplete
    search = Article.search params[:query], { 
      suggest: [:full_text], 
      fields: ["title^10", "article_body"],
      limit: 10
    }

    
    # binding.pry
    
  
    render json: search.map(&:title)
  end

  def show
    @article = Article.includes(likes: :user, comments: :user).find_by(slug: params[:slug])
    unless @article.user == current_user
      @article.increment!(:number_of_reads)
      ArticleStat.create!(user_id: current_user ? current_user.id : request.remote_ip, article: @article)
    end
  rescue => e
    nil
  end

  def by_following; end

  def edit; end

  def destroy
    @article = Article.destroy(params[:slug])
    flash[:info] = "Article was successfully deleted"
    redirect_to profile_path
  end

  def search
    @search_results = Article.search params[:query], suggest: [:full_text], fields: ["title^10", "article_body", {"username^10" => :exact}]
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
    article = Article.find_by(slug: params[:article_slug])
    like(article)
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
end

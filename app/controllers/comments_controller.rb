class CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid do |e|
    @error = e.message
    respond_to do |format|
      format.js { render partial: 'layouts/show_errors' }
    end
  end
  
  before_action proc { @comment = Comment.find(params[:id]) }, only: %i(destroy edit update)
  before_action proc { require_same_user @comment }, only: %i(destroy edit)
  def create
    @article = Article.find(params[:article_slug])
    @article.comments.create!(comment_params.merge(commenter: current_user))
    respond_to do |format|
      format.js { render partial: 'layouts/reload' }
    end
  end

  def like_comment
    comment = Comment.find(params[:comment_id])
    like(comment)
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js { render partial: 'layouts/reload' }
    end
  end

  def update
    @article = Article.find(params[:article_slug])
    @comment.update!(comment_params)
    respond_to do |format|
      format.js { render partial: 'layouts/reload' }
    end
  end 

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

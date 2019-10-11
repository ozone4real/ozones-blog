class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:id])
    @article.comments.create!(comment_params.merge(commenter: current_user))
    respond_to do |format|
      format.js { render partial: 'layouts/reload' }
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

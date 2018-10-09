class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @artile.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end

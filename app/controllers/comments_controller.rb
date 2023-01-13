class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params_comment)
    redirect_to article_path(@article)
  end

  private

  def params_comment
    params.require(:comment).permit(:commenter, :body)
  end
end

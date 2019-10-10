class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'The comment is created'
      redirect_to @post
    else
      flash[:alert] = 'Some thing wrong with your comment'
      render template: 'posts/show'
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

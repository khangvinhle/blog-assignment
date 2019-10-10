class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_post, only: %i[show destroy update edit]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'The post has been created'
      redirect_to @post
    else
      flash[:alert] = 'The post has not been created'
      render 'new'
    end
  end

  def show
    @comment = @post.comments.build
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

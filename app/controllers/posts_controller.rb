class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_post, only: %i[show destroy update edit]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'The post has been created'
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @comment = @post.comments.build
  end

  def edit;
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'The post has been updated'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'The post has been deleted!'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

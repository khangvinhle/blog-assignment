class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_post, only: %i[show destroy update edit]

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      flash[:notice] = 'The post has been created'
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    authorize @post
    @comment = @post.comments.build
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      flash[:notice] = 'The post has been updated'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    authorize @post
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

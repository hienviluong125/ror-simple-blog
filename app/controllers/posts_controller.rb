class PostsController < ApplicationController
  before_action :prepare_post, only: %i[show edit destroy update]

  def index
    authorize Post

    @pagy, @posts = pagy(
      current_user.posts.order(created_at: :desc), items: 5
    )
  end

  def new
    @post = current_user.posts.new

    authorize @post
  end

  def create
    @post = current_user.posts.new(post_params)
    authorize @post

    if @post.save
      redirect_to posts_path, notice: 'Post created succesfully'
    else
      render :new
    end
  end

  def show
    authorize @post
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post updated succesfully'
    else
      render :edit
    end
  end

  def destroy
    authorize @post

    if @post.destroy
      redirect_to posts_path, notice: 'Post deleted succesfully'
    else
      redirect_to posts_path, notice: 'Failure to delete post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :thumbnail, :description)
  end

  def prepare_post
    @post = Post.find(params[:id])
  end
end

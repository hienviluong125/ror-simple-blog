module Dashboard
  class PostsController < Dashboard::BaseController
    before_action :prepare_post, only: %i[edit update destroy]

    def index
      authorize Post

      @posts = Post.all
    end

    def new
      @post = current_user.posts.new
    end

    def create
      @post = current_user.posts.new(post_params)

      if @post.save
        redirect_to dashboard_posts_path, notice: 'Post created succesfully'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @post.update(post_params)
        redirect_to dashboard_posts_path, notice: 'Post updated succesfully'
      else
        render :edit
      end
    end

    def destroy
      if @post.destroy
        redirect_to dashboard_posts_path, notice: 'Post deleted succesfully'
      else
        redirect_to dashboard_posts_path, notice: 'Failure to delete post'
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

    def prepare_post
      @post = Post.find(params[:id])
    end
  end
end

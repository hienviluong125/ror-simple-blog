class PagesController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc), items: 5)

    respond_to do |format|
      format.html
      format.json do
        html = render_to_string(partial: 'posts/post', collection: @posts, as: :post, layout: false, formats: [:html])
        render json: { html: html, posts: @posts, next_page: @pagy.next, next_page_url: root_path(page: @pagy.next) }
      end
    end
  end
end

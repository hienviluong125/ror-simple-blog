require 'rails_helper'

RSpec.describe Dashboard::PostsController, type: :controller do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:posts) { FactoryBot.create_list(:post, 5) }
  let(:post_attributes) { FactoryBot.attributes_for(:post) }
  let(:existing_post) { FactoryBot.create(:post) }

  describe 'get #index' do
    def do_request
      sign_in admin_user
      get :index
    end

    context 'access to posts index page' do
      before { do_request }

      it { expect(assigns(:posts)).to match_array(posts) }
      it { expect(response).to render_template :index }
    end
  end

  describe 'get #new' do
    def do_request
      sign_in admin_user
      get :new
    end

    context 'access to posts new page' do
      before { do_request }

      it { expect(response).to render_template :new }
    end
  end

  describe 'post #create' do
    def do_request(params)
      sign_in admin_user
      post :create, params: params
    end

    context 'create a new post' do
      before do
        do_request({ post: post_attributes.merge(thumbnail: fixture_file_upload('sample.jpg', 'image/jpg')) })
      end

      it { expect(flash[:notice]).to eq 'Post created succesfully' }
      it { expect(response).to redirect_to dashboard_posts_path }
    end

    context 'create a new post with invalid params' do
      before do
        do_request({ post: post_attributes.merge(title: '') })
      end

      it { expect(response).to render_template :new }
    end
  end

  describe 'get #edit' do
    def do_request(params)
      sign_in admin_user
      get :edit, params: params
    end

    context 'access to post edit page' do
      before { do_request({ id: existing_post.id }) }

      it { expect(assigns(:post)).to eq existing_post }
      it { expect(response).to render_template :edit }
    end
  end

  describe 'put #update' do
    def do_request(params)
      sign_in admin_user
      put :update, params: params
    end

    context 'update a post' do
      before do
        do_request({ post: post_attributes.merge(thumbnail: fixture_file_upload('sample.jpg', 'image/jpg')), id: existing_post.id })
      end

      it { expect(flash[:notice]).to eq 'Post updated succesfully' }
      it { expect(response).to redirect_to dashboard_posts_path }
    end

    context 'update a post with invalid params' do
      before do
        do_request({ post: post_attributes.merge(title: '', thumbnail: fixture_file_upload('sample.jpg', 'image/jpg')), id: existing_post.id })
      end

      it { expect(response).to render_template :edit }
    end
  end

  describe 'delete #destroy' do
    def do_request(params)
      sign_in admin_user
      delete :destroy, params: params
    end

    context 'destroy a post' do
      before do
        do_request({ post: post_attributes, id: existing_post.id })
      end

      it { expect(flash[:notice]).to eq 'Post deleted succesfully' }
      it { expect(response).to redirect_to dashboard_posts_path }
    end

    context 'failure to destroy a post' do
      before do
        allow_any_instance_of(Post).to receive(:destroy).and_return(false)
        do_request({ post: post_attributes, id: existing_post.id })
      end

      it { expect(flash[:notice]).to eq 'Failure to delete post' }
      it { expect(response).to redirect_to dashboard_posts_path }
    end
  end
end

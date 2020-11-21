require 'rails_helper'

RSpec.describe Dashboard::PagesController, type: :controller do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  describe 'get #index with admin account' do
    def do_request
      sign_in admin_user
      get :index
    end

    context 'access to index page' do
      before { do_request }

      it { expect(response).to render_template :index }
    end
  end

  describe 'get #index without admin account' do
    def do_request
      sign_in user
      get :index
    end

    context 'access to index page' do
      before { do_request }

      it 'redirect to index and receive flash message' do
        expect(flash[:alert]).to eq 'The page you are looking for does not exist'
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'get #index without authentication' do
    def do_request
      get :index
    end

    context 'access to index page' do
      before { do_request }

      it 'redirect to sign_in page and receive flash message' do
        expect(flash[:alert]).to eq 'You need to sign in or sign up before continuing.'
        expect(response).to redirect_to user_session_path
      end
    end
  end
end

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:posts) { FactoryBot.create_list(:post, 5) }

  describe 'get #index' do
    def do_request
      get :index
    end

    context 'access to index page' do
      before { do_request }

      it { expect(assigns(:posts)).to match_array posts }
      it { expect(response).to render_template :index }
    end
  end

  describe 'get #contact' do
    def do_request
      get :contact
    end

    context 'access to contact page' do
      before { do_request }

      it { expect(response).to render_template :contact }
    end
  end

  describe 'get #about' do
    def do_request
      get :about
    end

    context 'access to about page' do
      before { do_request }

      it { expect(response).to render_template :about }
    end
  end
end

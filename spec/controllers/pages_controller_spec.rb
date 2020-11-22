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
end

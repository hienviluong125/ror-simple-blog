require 'rails_helper'

RSpec.describe Dashboard::PagesController, type: :controller do
  describe 'get #index' do
    def do_request
      get :index
    end

    context 'access to index page' do
      before { do_request }

      it { expect(response).to render_template :index }
    end
  end
end

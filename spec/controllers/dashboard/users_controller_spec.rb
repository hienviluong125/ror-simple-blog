require 'rails_helper'

RSpec.describe Dashboard::UsersController, type: :controller do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let!(:users) { FactoryBot.create_list(:user, 5) }

  describe 'get #index' do
    def do_request
      sign_in admin_user
      get :index
    end

    context 'access to dashboard user index page' do
      before { do_request }

      it { expect(assigns(:users)).to match_array(users + [admin_user]) }
      it { expect(response).to render_template :index }
    end
  end
end

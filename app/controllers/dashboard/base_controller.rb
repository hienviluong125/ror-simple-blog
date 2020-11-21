module Dashboard
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
    layout 'dashboard'

    private

    def authenticate_admin!
      redirect_to root_path, alert: 'The Page you are looking for does not exist' unless current_user.admin?
    end

    def authorize(record, query = nil)
      super([:dashboard, record], query, policy_class: "#{controller_path.classify}Policy".constantize)
    end
  end
end

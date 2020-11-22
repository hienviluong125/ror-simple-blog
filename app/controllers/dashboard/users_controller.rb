module Dashboard
  class UsersController < Dashboard::BaseController
    def index
      authorize User

      @pagy, @users = pagy(User.all, items: 10)
    end
  end
end

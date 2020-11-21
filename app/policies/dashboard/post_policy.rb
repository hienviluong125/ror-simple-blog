module Dashboard
  class PostPolicy
    attr_reader :user, :post

    def initialize(user, post)
      @user = user
      @post = post
    end

    def index?
      user.admin?
    end

    def new?
      user.admin?
    end

    def create?
      user.admin?
    end

    def edit?
      user.admin?
    end

    def update?
      user.admin?
    end

    def destroy?
      user.admin?
    end
  end
end

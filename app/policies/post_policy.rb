class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    user.present?
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def show?
    true
  end

  def edit?
    user&.admin? || post.user == user
  end

  def update?
    user&.admin? || post.user == user
  end

  def destroy?
    user&.admin? || post.user == user
  end
end

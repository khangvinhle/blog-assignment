class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    true
  end

  def create?
    true if user_logged_in?
  end

  def new?
    create?
  end

  def update?
    true if user_logged_in? && (post_creator? || admin?)
  end

  def edit?
    update?
  end

  def destroy?
    true if user_logged_in? && (post_creator? || admin?)
  end

  def user_logged_in?
    @current_user.present?
  end

  def post_creator?
    true if @post.user == @user
  end

  def admin?
    @user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: current_user)
      end
    end
  end
end

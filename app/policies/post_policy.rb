class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
    super
  end

  def update?
    @user.id == @post.user_id
  end

  def edit?
    update? 
  end

  def destroy?
    update? || @user.Moderator?
  end
end

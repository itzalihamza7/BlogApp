class LikePolicy < ApplicationPolicy
  attr_accessor :user, :like

  def initialize(user, like)
    @user = user
    @like = like
    super
  end

  def destroy?
    @user.id == @like.user_id || @user.Moderator?
  end
end

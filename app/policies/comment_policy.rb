class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
    super
  end

  def update?
    @user.id == @comment.user_id
  end

  def destroy?
    update? || @user.Moderator?
  end


end

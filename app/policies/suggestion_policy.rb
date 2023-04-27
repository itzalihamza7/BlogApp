class SuggestionPolicy < ApplicationPolicy
  attr_reader :user, :suggestion

  def initialize(user, suggestion)
    @user = user
    @suggestion = suggestion
    super
  end

  def update?
    @user.id == @suggestion.user_id
  end

  def edit?
    update?
  end

  def destroy?
    update? || @user.Moderator?
  end


end

class ReportPolicy < ApplicationPolicy
  attr_accessor :user, :report

  def initialize(user, report)
    @user = user
    @report = report
    super
  end


  def destroy?
    @user.id == @report.user_id || @user.Moderator?
  end

end

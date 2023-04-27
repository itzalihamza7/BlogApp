# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  layout 'users'

  def index
    @users = User.all
  end

  def show; end
end

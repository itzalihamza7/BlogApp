module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      flash[:alert] = 'The record you are looking for could not be found'
    end

    rescue_from Pundit::NotAuthorizedError do
      flash[:alert] = 'The action you are trying to perform is not authorized'
    end
  end
end

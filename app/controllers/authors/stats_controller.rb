# frozen_string_literal: true

module Authors
  class StatsController < UsersController
    before_action :authenticate_user!

    def index
      @count_by_date = PageView.count_by_date(7.days.ago, Date.today)
      @unique_count_by_date = PageView.uniq_count_by_date(7.days.ago, Date.today)
    end
  end
end

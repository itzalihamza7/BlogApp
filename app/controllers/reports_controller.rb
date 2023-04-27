# frozen_string_literal: true

class ReportsController < ApplicationController
  def create
    @report = current_user.reports.new(report_params)
    @reportable = @report.reportable
    if @report.save
      flash[:notice] = 'Report was successfully created.'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Report was not created.'
    end
  end

  def destroy
    @report = current_user.reports.find(params[:id])
    @reportable = @report.reportable
    authorize @report
    @report.destroy
    if @report.destroyed?
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Report was not destroyed.'
    end
  end

  private

  def report_params
    params.require(:report).permit(:reportable_id, :reportable_type)
  end
end

class ReportsController < ApplicationController
  before_filter :admin_only, only: [:mark_pending, :mark_solved]

  def new
    @report ||= Report.new
    render
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to root_path, notice: "Thank you! An admin will review your report!"
    else
      render 'new'
    end
  end

  def show
    @report = Report.find(params[:id])
    if @report
      render
    else
      redirect_to dashboard_path, notice: "Oopss! Report not found!"
    end
  end

  def mark_pending
    @report = Report.find(params[:id])
    @report.update_attributes(status: 0)
    redirect_to report_path(@report)
  end

  def mark_solved
    @report = Report.find(params[:id])
    @report.update_attributes(status: 1)
    redirect_to report_path(@report)
  end

  private

  def report_params
    params.require(:report).permit(:content, :url, :category)
  end
end

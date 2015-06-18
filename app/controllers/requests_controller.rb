class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_user, only: [:new, :create]
  before_filter :admin_only, only: [:set_pending, :set_approved, :set_rejected, :set_closed]

  def new
    @request ||= Request.new
    render
  end

  def create
    @request = @user.requests.new(request_params)
    if @request.save
      redirect_to dashboard_path, notice: "Thank you! An admin will review your request!"
    else
      render 'new'
    end
  end

  def show
    @request = Request.find(params[:id])
    if @request
      render
    else
      redirect_to dashboard_path, notice: "Oopss! Request not found!"
    end
  end

  def set_pending
    @request = Request.find(params[:id])
    @request.update_attributes(status: 0)
    redirect_to request_path(@request)
  end

  def set_approved
    @request = Request.find(params[:id])
    @request.update_attributes(status: 1)
    redirect_to request_path(@request)
  end

  def set_rejected
    @request = Request.find(params[:id])
    @request.update_attributes(status: 2)
    redirect_to request_path(@request)
  end

  def set_closed
    @request = Request.find(params[:id])
    @request.update_attributes(status: 3)
    redirect_to request_path(@request)
  end

  private

  def set_user
    @user = current_user
  end

  def request_params
    params.require(:request).permit(:user_id, :title, :content)
  end
end

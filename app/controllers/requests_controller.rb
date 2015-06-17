class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_user, only: [:new, :create]

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

  private

  def set_user
    @user = current_user
  end

  def request_params
    params.require(:request).permit(:user_id, :title, :content)
  end
end

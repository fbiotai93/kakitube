class DashboardsController < ApplicationController
	before_action :authenticate_user!

  def index
    @requests = Request.where(user_id:current_user)
    @all_requests = Request.all
  end
end

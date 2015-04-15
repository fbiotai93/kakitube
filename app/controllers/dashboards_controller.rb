class DashboardsController < ApplicationController
	before_action :authenticate_user!
  before_filter :admin_only

  def index
  end
end

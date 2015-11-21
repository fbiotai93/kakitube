class DashboardsController < ApplicationController
	before_action :authenticate_user!

  def index
		@bookmarks = Bookmark.where(user_id:current_user)
    @requests = Request.where(user_id:current_user)
    @all_requests = Request.all
		@all_reports = Report.all
  end
end

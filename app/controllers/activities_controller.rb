class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_filter :admin_only

  def index
    @activities = PublicActivity::Activity.order("created_at desc").paginate(:page => params[:page], :per_page => 30)
  end
end

class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_filter :admin_only

  def index
    @activities = PublicActivity::Activity.order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
    @admins = User.where(admin: 1)
    @post = Post.all
    @siri = Siri.all
  end
end

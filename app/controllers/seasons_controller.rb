class SeasonsController < ApplicationController
	before_action :authenticate_user!
	before_filter :set_siri, only: [:index, :new, :create]
  before_filter :admin_only

  def index
  	@seasons = Season.where(siri_id: @siri).to_a
  end

  def new
  	@season ||= Season.new
    render
  end

  def create
  	@season = @siri.seasons.new(season_params)
  	if @season.save
  		redirect_to siri_seasons_path, notice: "New season has been created."
  	else
  		render 'new'
  	end
  end

  private

  def set_siri
  	@siri = Siri.find(params[:siri_id])
  end

  def set_season
  	@season = Season.where(id: params[:id], siri: @siri).take
  end

  def season_params
  	params.require(:season).permit(:siri_id, :title, :poster)
  end
end

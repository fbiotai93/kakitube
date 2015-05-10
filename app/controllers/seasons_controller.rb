class SeasonsController < ApplicationController
	before_action :authenticate_user!
	before_filter :set_siri, only: [:index, :new, :create, :edit, :update, :destroy]
  before_filter :set_season, only: [:edit, :update, :destroy]
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

  def edit
    if @season
      render
    else
      redirect_to siri_seasons_path, notice: "Sorry! Season not found"
    end
  end

  def update
    if @season.update_attributes(season_params)
      redirect_to siri_seasons_path, notice: "Successfully updated season."
    else
      render 'edit'
    end
  end

  def destroy
    @season.destroy
    redirect_to siri_seasons_path, notice: "Successfully destroyed season."
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

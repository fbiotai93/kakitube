class AsianSeasonsController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_asian, only: [:index, :new, :create, :edit, :update, :destroy]
  before_filter :set_asian_season, only: [:edit, :update, :destroy]
  before_filter :admin_only

  def index
  	@asian_seasons = AsianSeason.where(asian_id: @asian).to_a
  end

  def new
  	@asian_season ||= AsianSeason.new
    render
  end

  def create
  	@asian_season = @asian.asian_seasons.new(asian_season_params)
  	if @asian_season.save
  		redirect_to asian_asian_seasons_path, notice: "New asian drama season has been created."
  	else
  		render 'new'
  	end
  end

  def edit
    if @asian_season
      render
    else
      redirect_to asian_asian_seasons_path, notice: "Sorry! Asian Drama season not found"
    end
  end

  def update
    if @asian_season.update_attributes(asian_season_params)
      redirect_to asian_asian_seasons_path, notice: "Successfully updated asian drama season."
    else
      render 'edit'
    end
  end

  def destroy
    @asian_season.destroy
    redirect_to asian_asian_seasons_path, notice: "Successfully destroyed asian drama season."
  end

  private

  def set_asian
  	@asian = Asian.find(params[:asian_id])
  end

  def set_asian_season
  	@asian_season = AsianSeason.where(id: params[:id], asian: @asian).take
  end

  def asian_season_params
  	params.require(:asian_season).permit(:asian_id, :title)
  end
end

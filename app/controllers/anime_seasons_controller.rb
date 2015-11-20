class AnimeSeasonsController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_anime, only: [:index, :new, :create, :edit, :update, :destroy]
  before_filter :set_anime_season, only: [:edit, :update, :destroy]
  before_filter :admin_only

  def index
  	@anime_seasons = AnimeSeason.where(anime_id: @anime).to_a
  end

  def new
  	@anime_season ||= AnimeSeason.new
    render
  end

  def create
  	@anime_season = @anime.anime_seasons.new(anime_season_params)
  	if @anime_season.save
  		redirect_to anime_anime_seasons_path, notice: "New anime season has been created."
  	else
  		render 'new'
  	end
  end

  def edit
    if @anime_season
      render
    else
      redirect_to anime_anime_seasons_path, notice: "Sorry! Anime season not found"
    end
  end

  def update
    if @anime_season.update_attributes(anime_season_params)
      redirect_to anime_anime_seasons_path, notice: "Successfully updated anime season."
    else
      render 'edit'
    end
  end

  def destroy
    @anime_season.destroy
    redirect_to anime_anime_seasons_path, notice: "Successfully destroyed anime season."
  end

  private

  def set_anime
  	@anime = Anime.find(params[:anime_id])
  end

  def set_anime_season
  	@anime_season = AnimeSeason.where(id: params[:id], anime: @anime).take
  end

  def anime_season_params
  	params.require(:anime_season).permit(:anime_id, :title)
  end
end

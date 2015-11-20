class AnimeEpisodesController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_anime_season, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_filter :set_anime_episode, only: [:show, :edit, :update, :destroy]
  before_filter :admin_only

  def index
  	@anime_episodes = AnimeEpisode.where(anime_season_id: @anime_season).to_a
  end

  def new
  	@anime_episode ||= AnimeEpisode.new
    render
  end

  def create
  	@anime_episode = @anime_season.anime_episodes.new(anime_episode_params)
  	if @anime_episode.save
  		redirect_to anime_anime_season_anime_episodes_path, notice: "New anime episode has been created."
  	else
  		render 'new'
  	end
  end

  def show
    if @anime_episode
      render
    else
      redirect_to anime_anime_season_anime_episodes_path, notice: "Sorry! Anime episode not found"
    end
  end

  def edit
    if @anime_episode
      render
    else
      redirect_to anime_anime_season_anime_episodes_path, notice: "Sorry! Anime episode not found"
    end
  end

  def update
    if @anime_episode.update_attributes(anime_episode_params)
      redirect_to anime_anime_season_anime_episodes_path, notice: "Successfully updated anime episode."
    else
      render 'edit'
    end
  end

  def destroy
    @anime_episode.destroy
    redirect_to anime_anime_season_anime_episodes_path, notice: "Successfully destroyed anime episode."
  end

  private

  def set_anime_season
  	@anime_season = AnimeSeason.find(params[:anime_season_id])
  end

  def set_anime_episode
  	@anime_episode = AnimeEpisode.where(id: params[:id], anime_season: @anime_season).take
  end

  def anime_episode_params
  	params.require(:anime_episode).permit(:anime_season_id, :title, :embed, :embed2, :embed3)
  end
end

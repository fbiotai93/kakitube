class EpisodesController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_season, only: [:index, :new, :create]
  before_filter :admin_only

  def index
  	@episodes = Episode.where(season_id: @season).to_a
  end

  def new
  	@episode ||= Episode.new
    render
  end

  def create
  	@episode = @season.episodes.new(episode_params)
  	if @episode.save
  		redirect_to siri_season_episodes_path, notice: "New episode has been created."
  	else
  		render 'new'
  	end
  end

  private

  def set_season
  	@season = Season.find(params[:season_id])
  end

  def set_episode
  	@episode = Episode.where(id: params[:id], season: @season).take
  end

  def episode_params
  	params.require(:episode).permit(:season_id, :title, :embed)
  end
end

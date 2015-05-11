class EpisodesController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_season, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_filter :set_episode, only: [:show, :edit, :update, :destroy]
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

  def show
    if @episode
      render
    else
      redirect_to siri_season_episodes_path, notice: "Sorry! Episode not found"
    end
  end

  def edit
    if @episode
      render
    else
      redirect_to siri_season_episodes_path, notice: "Sorry! Season not found"
    end
  end

  def update
    if @episode.update_attributes(episode_params)
      redirect_to siri_season_episodes_path, notice: "Successfully updated episode."
    else
      render 'edit'
    end
  end

  def destroy
    @episode.destroy
    redirect_to siri_season_episodes_path, notice: "Successfully destroyed episode."
  end

  private

  def set_season
  	@season = Season.find(params[:season_id])
  end

  def set_episode
  	@episode = Episode.where(id: params[:id], season: @season).take
  end

  def episode_params
  	params.require(:episode).permit(:season_id, :title, :embed, :embed2, :embed3)
  end
end

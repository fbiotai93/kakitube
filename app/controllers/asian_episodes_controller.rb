class AsianEpisodesController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_asian_season, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_filter :set_asian_episode, only: [:show, :edit, :update, :destroy]
  before_filter :admin_only

  def index
  	@asian_episodes = AsianEpisode.where(asian_season_id: @asian_season).to_a
  end

  def new
  	@asian_episode ||= AsianEpisode.new
    render
  end

  def create
  	@asian_episode = @asian_season.asian_episodes.new(asian_episode_params)
  	if @asian_episode.save
  		redirect_to asian_asian_season_asian_episodes_path, notice: "New asian drama episode has been created."
  	else
  		render 'new'
  	end
  end

  def show
    if @asian_episode
      render
    else
      redirect_to asian_asian_season_asian_episodes_path, notice: "Sorry! Asian Drama episode not found"
    end
  end

  def edit
    if @asian_episode
      render
    else
      redirect_to asian_asian_season_asian_episodes_path, notice: "Sorry! Asian Drama episode not found"
    end
  end

  def update
    if @asian_episode.update_attributes(asian_episode_params)
      redirect_to asian_asian_season_asian_episodes_path, notice: "Successfully updated asian drama episode."
    else
      render 'edit'
    end
  end

  def destroy
    @asian_episode.destroy
    redirect_to asian_asian_season_asian_episodes_path, notice: "Successfully destroyed asian drama episode."
  end

  private

  def set_asian_season
  	@asian_season = AsianSeason.find(params[:asian_season_id])
  end

  def set_anime_episode
  	@asian_episode = AsianEpisode.where(id: params[:id], asian_season: @asian_season).take
  end

  def asian_episode_params
  	params.require(:asian_episode).permit(:asian_season_id, :title, :embed, :embed2, :embed3)
  end
end

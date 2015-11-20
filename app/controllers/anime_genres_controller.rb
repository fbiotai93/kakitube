class AnimeGenresController < ApplicationController
  before_action :authenticate_user!
  before_filter :admin_only

  def index
  	@anime_genres = AnimeGenre.all
  end

  def new
  	@anime_genre ||= AnimeGenre.new
  	render
  end

  def create
  	@anime_genre = AnimeGenre.create!(anime_genre_params)
  	respond_to do |format|
			format.html { redirect_to anime_genres_path, notice: "Good! Anime Genre has been added" }
			format.js
		end
  end

  def destroy
  	@anime_genre = AnimeGenre.destroy(params[:id])
		redirect_to anime_genres_path, notice: "Good! Anime Genre has been remove"
  end

  private

  def anime_genre_params
  	params.require(:anime_genre).permit(:name)
  end
end

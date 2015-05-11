class SiriGenresController < ApplicationController
	before_action :authenticate_user!
  before_filter :admin_only

  def index
  	@siri_genres = SiriGenre.all
  end

  def new
  	@siri_genre ||= SiriGenre.new
  	render
  end

  def create
  	@siri_genre = SiriGenre.create!(siri_genre_params)
  	respond_to do |format|
			format.html { redirect_to siri_genres_path, notice: "Good! TV Series Genre has been added" }
			format.js
		end
  end

  def destroy
  	@siri_genre = SiriGenre.destroy(params[:id])
		redirect_to siri_genres_path, notice: "Good! TV Series Genre has been remove"
  end

  private

  def siri_genre_params
  	params.require(:siri_genre).permit(:name)
  end
end

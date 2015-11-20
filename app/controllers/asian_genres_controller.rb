class AsianGenresController < ApplicationController
  before_action :authenticate_user!
  before_filter :admin_only

  def index
  	@asian_genres = AsianGenre.all
  end

  def new
  	@asian_genre ||= AsianGenre.new
  	render
  end

  def create
  	@asian_genre = AsianGenre.create!(asian_genre_params)
  	respond_to do |format|
			format.html { redirect_to asian_genres_path, notice: "Good! Asian Genre has been added" }
			format.js
		end
  end

  def destroy
  	@asian_genre = AsianGenre.destroy(params[:id])
		redirect_to asian_genres_path, notice: "Good! Asian Genre has been remove"
  end

  private

  def asian_genre_params
  	params.require(:asian_genre).permit(:name)
  end
end

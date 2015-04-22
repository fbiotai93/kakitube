class GenresController < ApplicationController
	before_action :authenticate_user!
  before_filter :admin_only

  def index
  	@genres = Genre.all
  end

  def new
  	@genre ||= Genre.new
  	render
  end

  def create
  	@genre = Genre.create!(genre_params)
  	respond_to do |format|
			format.html { redirect_to genres_path, notice: "Good! Genre has been added" }
			format.js
		end
  end

  def destroy
  	@genre = Genre.destroy(params[:id])
		redirect_to genres_path, notice: "Good! Genre has been remove"
  end

  private

  def genre_params
  	params.require(:genre).permit(:name)
  end
end

class AnimesController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_user, only: [:new, :create]
	before_filter :set_anime, only: [:show, :edit, :update, :destroy]
  before_filter :admin_only
  include HTTParty

  def index
  	@animes = Anime.all
  end

  def show
  	if @anime
      respond_to do |format|
        format.html { @anime }
        format.json { render json: @anime.to_json(include: [:user]) }
      end
    else
      redirect_to animes_path, notice: "Sorry! Anime not found"
    end
  end

  def new
  	@anime ||= Anime.new
  	render
  end

  def create
  	@anime = @user.animes.new(anime_params)
    if params[:preview_button]
      url = "http://www.omdbapi.com/?i=#{@anime.imdbID}&plot=full&r=json"
      @response = HTTParty.get(URI.encode(url))
      @result = JSON.parse(@response.body)
      @anime.title = @result["Title"]
      @anime.year = @result["Year"]
      @anime.rated = @result["Rated"]
      @anime.released = @result["Released"]
      @anime.runtime = @result["Runtime"]
      @anime.director = @result["Director"]
      @anime.writer = @result["Writer"]
      @anime.actors = @result["Actors"]
      @anime.description = @result["Plot"]
      @anime.language = @result["Language"]
      @anime.country = @result["Country"]
      @anime.metascore = @result["Metascore"]
      @anime.imdbrating = @result["imdbRating"]
      @anime.imdbvotes = @result["imdbVotes"]
      render 'new'
    elsif params[:submit]
    	if @anime.save
        expire_fragment("latest-anime-update")
        expire_fragment("anime-list")
        redirect_to animes_path, notice: "Successfully created anime."
      else
        render 'new'
      end
    end
  end

  def edit
    if @anime
      render
    else
      redirect_to animes_path, notice: "Sorry! Anime not found"
    end
  end

  def update
    if @anime.update_attributes(anime_params)
      expire_fragment("latest-anime-update")
      expire_fragment("anime-list")
      redirect_to animes_path, notice: "Successfully updated anime."
    else
      render 'edit'
    end
  end

  def destroy
    @anime.destroy
    redirect_to animes_path, notice: "Successfully destroyed anime."
  end

  private

  def set_user
  	@user = current_user
  end

  def set_anime
    @anime = Anime.find(params[:id])
  end

  def anime_params
  	params.require(:anime).permit(:title, :status, :imdbID, :poster, :poster_cache, :header_image, :header_image_cache, :year, :rated, :released, :runtime, :description, :director, :writer, :actors, :language, :country, :anime_genre_id, :awards, :metascore, :imdbrating, :imdbvotes, :gallery_image_1, :gallery_image_1_cache, :gallery_image_2, :gallery_image_2_cache, :gallery_image_3, :gallery_image_3_cache, :bg_image, :bg_image_cache)
  end
end

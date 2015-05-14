class SirisController < ApplicationController
	before_action :authenticate_user!
	before_filter :set_user, only: [:new, :create]
	before_filter :set_siri, only: [:show, :edit, :update, :destroy]
  before_filter :admin_only
  include HTTParty

  def index
  	@siris = Siri.all
  end

  def show
  	if @siri
      respond_to do |format|
        format.html { @siri }
        format.json { render json: @siri.to_json(include: [:user]) }
      end
    else
      redirect_to siris_path, notice: "Sorry! Siri not found"
    end
  end

  def new
  	@siri ||= Siri.new
  	render
  end

  def create
  	@siri = @user.siris.new(siri_params)
    if params[:preview_button]
      url = "http://www.omdbapi.com/?i=#{@siri.imdbID}&plot=full&r=json"
      @response = HTTParty.get(URI.encode(url))
      @result = JSON.parse(@response.body)
      @siri.title = @result["Title"]
      @siri.year = @result["Year"]
      @siri.rated = @result["Rated"]
      @siri.released = @result["Released"]
      @siri.runtime = @result["Runtime"]
      @siri.director = @result["Director"]
      @siri.writer = @result["Writer"]
      @siri.actors = @result["Actors"]
      @siri.description = @result["Plot"]
      @siri.language = @result["Language"]
      @siri.country = @result["Country"]
      @siri.metascore = @result["Metascore"]
      @siri.imdbrating = @result["imdbRating"]
      @siri.imdbvotes = @result["imdbVotes"]
      render 'new'
    elsif params[:submit]
    	if @siri.save
        # expire_fragment("featured_articles")
        redirect_to siris_path, notice: "Successfully created siri."
      else
        render 'new'
      end
    end
  end

  def edit
    if @siri
      render
    else
      redirect_to siris_path, notice: "Sorry! Siri not found"
    end
  end

  def update
    if @siri.update_attributes(siri_params)
      # expire_fragment("featured_articles")
      redirect_to siris_path, notice: "Successfully updated siri."
    else
      render 'edit'
    end
  end

  def destroy
    @siri.destroy
    redirect_to siris_path, notice: "Successfully destroyed siri."
  end

  private

  def set_user
  	@user = current_user
  end

  def set_siri
    @siri = Siri.find(params[:id])
  end

  def siri_params
  	params.require(:siri).permit(:title, :status, :imdbID, :poster, :poster_cache, :header_image, :header_image_cache, :year, :rated, :released, :runtime, :description, :director, :writer, :actors, :language, :country, :siri_genre_id, :awards, :metascore, :imdbrating, :imdbvotes, :gallery_image_1, :gallery_image_1_cache, :gallery_image_2, :gallery_image_2_cache, :gallery_image_3, :gallery_image_3_cache, :bg_image, :bg_image_cache)
  end
end

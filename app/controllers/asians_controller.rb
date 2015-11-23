class AsiansController < ApplicationController
  before_action :authenticate_user!
	before_filter :set_user, only: [:new, :create]
	before_filter :set_asian, only: [:show, :edit, :update, :destroy]
  before_filter :admin_only
  include HTTParty

  def index
  	@asians = Asian.all
  end

  def show
  	if @asian
      respond_to do |format|
        format.html { @asian }
        format.json { render json: @asian.to_json(include: [:user]) }
      end
    else
      redirect_to asians_path, notice: "Sorry! Asian Drama not found"
    end
  end

  def new
  	@asian ||= Asian.new
  	render
  end

  def create
  	@asian = @user.asians.new(asian_params)
    if params[:preview_button]
      url = "http://www.omdbapi.com/?i=#{@asian.imdbID}&plot=full&r=json"
      @response = HTTParty.get(URI.encode(url))
      @result = JSON.parse(@response.body)
      @asian.title = @result["Title"]
      @asian.year = @result["Year"]
      @asian.rated = @result["Rated"]
      @asian.released = @result["Released"]
      @asian.runtime = @result["Runtime"]
      @asian.director = @result["Director"]
      @asian.writer = @result["Writer"]
      @asian.actors = @result["Actors"]
      @asian.description = @result["Plot"]
      @asian.language = @result["Language"]
      @asian.country = @result["Country"]
      @asian.metascore = @result["Metascore"]
      @asian.imdbrating = @result["imdbRating"]
      @asian.imdbvotes = @result["imdbVotes"]
      render 'new'
    elsif params[:submit]
    	if @asian.save
        expire_fragment("latest-asian-update")
        expire_fragment("asian-list")
        redirect_to asians_path, notice: "Successfully created asian drama."
      else
        render 'new'
      end
    end
  end

  def edit
    if @asian
      render
    else
      redirect_to asians_path, notice: "Sorry! Asian Drama not found"
    end
  end

  def update
    if @asian.update_attributes(asian_params)
      expire_fragment("latest-asian-update")
      expire_fragment("asian-list")
      redirect_to asians_path, notice: "Successfully updated asian drama."
    else
      render 'edit'
    end
  end

  def destroy
    @asian.destroy
    redirect_to asians_path, notice: "Successfully destroyed asian."
  end

  private

  def set_user
  	@user = current_user
  end

  def set_asian
    @asian = Asian.find(params[:id])
  end

  def asian_params
  	params.require(:asian).permit(:title, :status, :imdbID, :poster, :poster_cache, :header_image, :header_image_cache, :year, :rated, :released, :runtime, :description, :director, :writer, :actors, :language, :country, :asian_genre_id, :awards, :metascore, :imdbrating, :imdbvotes, :gallery_image_1, :gallery_image_1_cache, :gallery_image_2, :gallery_image_2_cache, :gallery_image_3, :gallery_image_3_cache)
  end
end

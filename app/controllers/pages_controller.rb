class PagesController < ApplicationController
  before_filter :latest_update, only: [:index, :show, :view, :search, :movies, :series]

  def index
		@posts = Post.all
		@featured = @posts.featured.random.take(1)
		@published_only = @posts.published_only.paginate(:page => params[:page], :per_page => 10)
    @random_movie = @posts.random.take(3)
    @carousel_movie = @random_movie.shift(4)

    @siris = Siri.all.paginate(:page => params[:page], :per_page => 10)
    @random_siri = @siris.random.take(3)
    @carousel_siri = @random_siri.shift(4)
  end

  def show
    @post = Post.find(params[:id])
  end

  def view
    @siri = Siri.find(params[:id])
  end

  def search
    @q = params[:q]
    @search = Sunspot.search [Post, Siri] do
      fulltext params[:q]
      paginate :page => params[:page] || 1, :per_page => 30
    end
    @posts = @search.results
  end

  def movies
    @genre = Genre.find_by_slug(params[:sort])
    if @genre
      @posts = Post.by_genre(@genre.id).paginate(:page => params[:page], :per_page => 30)
    else
      @posts = Post.all.paginate(:page => params[:page], :per_page => 30)
      flash.now[:notice] = "No posts found for '#{params[:sort]}'." if !params[:sort].blank?
    end
    @random_movie = @posts.random.take(3)
    @carousel_movie = @random_movie.shift(4)
  end

  def series
    @siri_genre = SiriGenre.find_by_slug(params[:view])
    if @siri_genre
      @siris = Siri.by_siri_genre(@siri_genre.id).paginate(:page => params[:page], :per_page => 30)
    else
      @siris = Siri.all.paginate(:page => params[:page], :per_page => 30)
      flash.now[:notice] = "No posts found for '#{params[:view]}'." if !params[:view].blank?
    end
    @random_siri = @siris.random.take(3)
    @carousel_siri = @random_siri.shift(4)
  end

  private

  def latest_update
    @siris = Siri.all.paginate(:page => params[:page], :per_page => 10)
    @latest_update = @siris.latest_update.limit(5)
  end
end

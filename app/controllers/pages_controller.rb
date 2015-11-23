class PagesController < ApplicationController
  before_filter :latest_update, only: [:index, :show, :view, :ep, :anime_view, :anime_ep, :asian_view, :asian_ep, :search, :movies, :series, :anime_series, :asian_series]

  def index
		@posts = Post.all
		@featured = @posts.featured.random.take(1)
		@published_only = @posts.published_only.paginate(:page => params[:page], :per_page => 10)
    @random_movie = @posts.random.take(3)
    # @carousel_movie = @random_movie.shift(4)

    @siris = Siri.all.paginate(:page => params[:page], :per_page => 10)
    @random_siri = @siris.random.take(3)
    # @carousel_siri = @random_siri.shift(4)

    @animes = Anime.all.paginate(:page => params[:page], :per_page => 10)
    @random_anime = @animes.random.take(3)
    # @carousel_anime = @random_anime.shift(4)

    @asians = Asian.all.paginate(:page => params[:page], :per_page => 10)
    @random_asian = @asians.random.take(3)
    # @carousel_asian = @random_asian.shift(4)
  end

  # show page for movie
  def show
    @post = Post.find(params[:id])
    @bookmark = current_user ? current_user.try(:bookmarking?, @post) : nil
  end

  # show page for tv series
  def view
    @siri = Siri.find(params[:id])
    @bookmark = current_user ? current_user.try(:bookmarking?, @siri) : nil
  end

  def ep
    @episode = Episode.find(params[:id])
    @siri = Siri.find(params[:siri_id])
    @season = Season.find(params[:season_id])
  end

  # show page for anime
  def anime_view
    @anime = Anime.find(params[:id])
    @bookmark = current_user ? current_user.try(:bookmarking?, @anime) : nil
  end

  def anime_ep
    @anime_episode = AnimeEpisode.find(params[:id])
    @anime = Anime.find(params[:anime_id])
    @anime_season = AnimeSeason.find(params[:anime_season_id])
  end

  # show page for asian drama
  def asian_view
    @asian = Asian.find(params[:id])
    @bookmark = current_user ? current_user.try(:bookmarking?, @asian) : nil
  end

  def asian_ep
    @asian_episode = AsianEpisode.find(params[:id])
    @asian = Asian.find(params[:asian_id])
    @asian_season = AsianSeason.find(params[:asian_season_id])
  end

  # search pages
  def search
    @q = params[:q]
    @search = Sunspot.search [Post, Siri, Anime, Asian] do
      fulltext params[:q]
      paginate :page => params[:page] || 1, :per_page => 30
    end
    @posts = @search.results
  end

  # list all movies
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

  # list all tv series
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

  # list all anime
  def anime_series
    @anime_genre = AnimeGenre.find_by_slug(params[:anime_view])
    if @anime_genre
      @animes = Anime.by_anime_genre(@anime_genre.id).paginate(:page => params[:page], :per_page => 30)
    else
      @animes = Anime.all.paginate(:page => params[:page], :per_page => 30)
      flash.now[:notice] = "No posts found for '#{params[:anime_view]}'." if !params[:anime_view].blank?
    end
    @random_anime = @animes.random.take(3)
    @carousel_anime = @random_anime.shift(4)
  end

  # list all asian drama
  def asian_series
    @asian_genre = AsianGenre.find_by_slug(params[:asian_view])
    if @asian_genre
      @asians = Asian.by_asian_genre(@asian_genre.id).paginate(:page => params[:page], :per_page => 30)
    else
      @asians = Asian.all.paginate(:page => params[:page], :per_page => 30)
      flash.now[:notice] = "No posts found for '#{params[:asian_view]}'." if !params[:asian_view].blank?
    end
    @random_asian = @asians.random.take(3)
    @carousel_asian = @random_asian.shift(4)
  end

  def developer
  end

  def dmca
  end

  private

  def latest_update
    @siris = Siri.all.paginate(:page => params[:page], :per_page => 10)
    @latest_update = @siris.latest_update.limit(5)

    @animes = Anime.all.paginate(:page => params[:page], :per_page => 10)
    @latest_anime_update = @animes.latest_update.limit(5)

    @asians = Asian.all.paginate(:page => params[:page], :per_page => 10)
    @latest_asian_update = @asians.latest_update.limit(5)
  end
end

class PagesController < ApplicationController
  def index
  # 	@posts = Post.all

  # 	@featured = @posts.featured.take(1)
  # 	@published_only = @posts.published_only.take(12)
		# render status: 200

		@genre = Genre.find_by_slug(params[:sort])
    @siri_genre = SiriGenre.find_by_slug(params[:sort])
  # 	if @genre
  # 		@posts = Post.by_genre(@genre.id)
  # 		@featured = @posts.featured.by_genre(@genre.id).take(1)
  # 		@published_only = @posts.published_only.by_genre(@genre.id).paginate(:page => params[:page], :per_page => 10)
  # 	else
  # 		@posts = Post.all
  # 		@featured = @posts.featured.take(1)
  # 		@published_only = @posts.published_only.paginate(:page => params[:page], :per_page => 10)
  # 		flash.now[:notice] = "No posts found for '#{params[:sort]}'." if !params[:sort].blank?
  # 	end

    # if @posts
      @posts = Post.all
      @featured = @posts.featured.take(1)
      @published_only = @posts.published_only.paginate(:page => params[:page], :per_page => 10)

      @siris = Siri.all.paginate(:page => params[:page], :per_page => 10)
    # end
  end

  def show
    @post = Post.find(params[:id])
  end

  def view
    @siri = Siri.find(params[:id])
  end

  def search
    @search = Sunspot.search [Post, Siri] do
      fulltext params[:q]
    end
    @posts = @search.results
  end
end

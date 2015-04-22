class PagesController < ApplicationController
  def index
  # 	@posts = Post.all

  # 	@featured = @posts.featured.take(1)
  # 	@published_only = @posts.published_only.take(12)
		# render status: 200

		@genre = Genre.find_by_slug(params[:sort])
  	if @genre
  		@posts = Post.by_genre(@genre.id)
  		@featured = @posts.featured.by_genre(@genre.id).take(1)
  		@published_only = @posts.published_only.by_genre(@genre.id).take(12)
  	else
  		@posts = Post.all
  		@featured = @posts.featured.take(1)
  		@published_only = @posts.published_only.take(12)
  		flash.now[:notice] = "No posts found for '#{params[:sort]}'." if !params[:sort].blank?
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end
end

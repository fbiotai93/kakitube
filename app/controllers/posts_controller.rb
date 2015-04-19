class PostsController < ApplicationController
	before_action :authenticate_user!
	before_filter :set_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :admin_only
  include HTTParty
  
  def index
  	@posts = Post.all
  end

  def new
  	@post ||= Post.new
  	render
  end

  def create
  	@post = @user.posts.new(post_params)
  	if params[:preview_button] || @post.save
      @response = HTTParty.get("http://www.omdbapi.com/?i=#{@post.imdbID}&plot=full&r=json")
      @result = JSON.parse(@response.body)
      render 'new'
    else
  		redirect_to posts_path, notice: "Good! Post has been publish"
  	end
  end

  def show
    if @post
      respond_to do |format|
        format.html { @post }
        format.json { render json: @post.to_json(include: [:user]) }
      end
    else
      redirect_to posts_path, notice: "Sorry! Post not found"
    end
  end

  def edit
    if @post
      render
    else
      redirect_to posts_path, notice: "Sorry! Post not found"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Good! Post has been update"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def set_user
  	@user = current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:user_id, :title, :description, :embed, :imdbID)
  end
end

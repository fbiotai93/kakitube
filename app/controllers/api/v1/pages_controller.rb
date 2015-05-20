module Api
  module V1
    class PagesController < ApplicationController
      respond_to :json
      before_action :authenticate

      # api/v1/movies
      def movies
        @posts = Post.all
        respond_with @posts.to_json(include: [genre: {except: [:id]}], except: [:user_id, :genre_id])
      end

      # api/v1/tv-series
      def series
        @siris = Siri.all
        respond_with @siris.to_json(include: [:siri_genre, seasons: {include: [episodes: { except: [:season_id] }], except: [:siri_id]}], except: [:user_id, :siri_genre_id])
      end

      #api/v1/movies/movie-title
      def show
        @post = Post.find(params[:id])
        respond_with @post.to_json(include: [genre: {except: [:id]}], except: [:user_id, :genre_id])
      end

      #api/v1/tv-series/series-title
      def view
        @siri = Siri.find(params[:id])
        respond_with @siri.to_json(include: [:siri_genre, seasons: {include: [episodes: { except: [:season_id] }], except: [:siri_id]}], except: [:user_id, :siri_genre_id])
      end

      private
 
        def authenticate
          api_key = request.headers['Access-Token']
          @user = User.where(api_key: api_key).first if api_key
         
          unless @user
            # head status: :unauthorized
            render :file => "public/restricted.html", status: :unauthorized
          end
        end

    end
  end
end
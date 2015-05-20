module Api
  module V1
    class PagesController < ApplicationController
      respond_to :json

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

    end
  end
end
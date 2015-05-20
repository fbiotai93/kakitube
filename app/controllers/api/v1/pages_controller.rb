module Api
  module V1
    class PagesController < ApplicationController
      respond_to :json

      # api/v1/movies
      def movies
        @posts = Post.all
        respond_with @posts.to_json(except: [:user_id])
      end

      # api/v1/tv-series
      def series
        @siris = Siri.all
        respond_with @siris.to_json(include: [seasons: {include: [:episodes]}], except: [:user_id])
      end

      #api/v1/movies/movie-name
      def show
        @post = Post.find(params[:id])
        respond_with @post.to_json(except: [:user_id])
      end

      #api/v1/tv-series/series-name
      def view
        @siri = Siri.find(params[:id])
        respond_with @siri.to_json(include: [seasons: {include: [:episodes]}], except: [:user_id])
      end

    end
  end
end
module Api
  module V1
    class ForumsController < ApplicationController
      respond_to :json

      def index
        @forums = Forum.all
      end

      def show
        @forum = Forum.find(params[:id])
      end
    end
  end
end
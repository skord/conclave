module Api
  module V1
    class ConversationsController < ApplicationController
      respond_to :json

      def index
        @forum = Forum.find(params[:forum_id])
        @conversations = @forum.conversations
      end

      def show
        @conversation = Conversation.find(params[:id])
      end
    end
  end
end
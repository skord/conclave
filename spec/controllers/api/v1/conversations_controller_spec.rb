require 'spec_helper'

describe Api::V1::ConversationsController do

  render_views

  before(:each) do
    @forum = create(:forum)
    @conversation = create(:conversation, forum: @forum)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :forum_id => @forum.id, format: 'json'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => @conversation.id, format: 'json'
    end
  end

end

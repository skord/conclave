require 'spec_helper'

describe Api::V1::ForumsController do

  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', format: 'json'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      Forum.should_receive(:find).with("1").and_return(create(:forum))
      get 'show', :id => 1, format: 'json'
      response.should be_success
    end
  end

  context "JSON" do
    describe "GET index" do
      it "should have urls embedded" do
        create(:forum)
        get 'index', format: 'json'
        response.status.should eq(200)
        JSON.parse(response.body)['urls'].inspect
      end
    end

    describe "GET show" do
      it "should have urls embedded" do
        Forum.should_receive(:find).with("1").and_return(create(:forum))
        get 'show', :id => 1, format: 'json'
        response.status.should eq(200)
        JSON.parse(response.body)['urls'].should be_present
      end
    end
  end


end

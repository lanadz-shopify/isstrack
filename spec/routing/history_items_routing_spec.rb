require "spec_helper"

describe HistoryItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/history_items").should route_to("history_items#index")
    end

    it "routes to #new" do
      get("/history_items/new").should route_to("history_items#new")
    end

    it "routes to #show" do
      get("/history_items/1").should route_to("history_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/history_items/1/edit").should route_to("history_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/history_items").should route_to("history_items#create")
    end

    it "routes to #update" do
      put("/history_items/1").should route_to("history_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/history_items/1").should route_to("history_items#destroy", :id => "1")
    end

  end
end

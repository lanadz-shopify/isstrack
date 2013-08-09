require "spec_helper"

describe HistoryItemsController do
  describe "routing" do

    xit "routes to #index" do
      get("/history_items").should route_to("history_items#index")
    end

    xit "routes to #new" do
      get("/history_items/new").should route_to("history_items#new")
    end

    xit "routes to #show" do
      get("/history_items/1").should route_to("history_items#show", :id => "1")
    end

    xit "routes to #edit" do
      get("/history_items/1/edit").should route_to("history_items#edit", :id => "1")
    end

    xit "routes to #create" do
      post("/history_items").should route_to("history_items#create")
    end

    xit "routes to #update" do
      put("/history_items/1").should route_to("history_items#update", :id => "1")
    end

    xit "routes to #destroy" do
      delete("/history_items/1").should route_to("history_items#destroy", :id => "1")
    end

  end
end

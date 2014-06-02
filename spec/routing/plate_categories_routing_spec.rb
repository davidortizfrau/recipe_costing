require "spec_helper"

describe PlateCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/plate_categories").should route_to("plate_categories#index")
    end

    it "routes to #new" do
      get("/plate_categories/new").should route_to("plate_categories#new")
    end

    it "routes to #show" do
      get("/plate_categories/1").should route_to("plate_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/plate_categories/1/edit").should route_to("plate_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/plate_categories").should route_to("plate_categories#create")
    end

    it "routes to #update" do
      put("/plate_categories/1").should route_to("plate_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/plate_categories/1").should route_to("plate_categories#destroy", :id => "1")
    end

  end
end

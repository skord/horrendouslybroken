require "spec_helper"

describe BucketsController do
  describe "routing" do

    it "routes to #index" do
      get("/buckets").should route_to("buckets#index")
    end

    it "routes to #new" do
      get("/buckets/new").should route_to("buckets#new")
    end

    it "routes to #show" do
      get("/buckets/1").should route_to("buckets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/buckets/1/edit").should route_to("buckets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/buckets").should route_to("buckets#create")
    end

    it "routes to #update" do
      put("/buckets/1").should route_to("buckets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/buckets/1").should route_to("buckets#destroy", :id => "1")
    end

  end
end

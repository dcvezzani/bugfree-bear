require "spec_helper"

describe NormalIssuesController do
  describe "routing" do

    it "routes to #index" do
      get("/normal_issues").should route_to("normal_issues#index")
    end

    it "routes to #new" do
      get("/normal_issues/new").should route_to("normal_issues#new")
    end

    it "routes to #show" do
      get("/normal_issues/1").should route_to("normal_issues#show", :id => "1")
    end

    it "routes to #edit" do
      get("/normal_issues/1/edit").should route_to("normal_issues#edit", :id => "1")
    end

    it "routes to #create" do
      post("/normal_issues").should route_to("normal_issues#create")
    end

    it "routes to #update" do
      put("/normal_issues/1").should route_to("normal_issues#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/normal_issues/1").should route_to("normal_issues#destroy", :id => "1")
    end

  end
end

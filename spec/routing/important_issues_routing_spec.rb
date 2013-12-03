require "spec_helper"

describe ImportantIssuesController do
  describe "routing" do

    it "routes to #index" do
      get("/important_issues").should route_to("important_issues#index")
    end

    it "routes to #new" do
      get("/important_issues/new").should route_to("important_issues#new")
    end

    it "routes to #show" do
      get("/important_issues/1").should route_to("important_issues#show", :id => "1")
    end

    it "routes to #edit" do
      get("/important_issues/1/edit").should route_to("important_issues#edit", :id => "1")
    end

    it "routes to #create" do
      post("/important_issues").should route_to("important_issues#create")
    end

    it "routes to #update" do
      put("/important_issues/1").should route_to("important_issues#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/important_issues/1").should route_to("important_issues#destroy", :id => "1")
    end

  end
end

require 'spec_helper'

describe "NormalIssues" do
  describe "GET /normal_issues" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get normal_issues_path
      response.status.should be(200)
    end
  end
end

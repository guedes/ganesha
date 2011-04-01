require "spec_helper"

describe CollectedDataController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/collected_data" }.should route_to(:controller => "collected_data", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/collected_data/1" }.should route_to(:controller => "collected_data", :action => "show", :id => "1")
    end

  end
end

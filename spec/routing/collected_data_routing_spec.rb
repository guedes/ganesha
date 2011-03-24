require "spec_helper"

describe CollectedDataController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/collected_data" }.should route_to(:controller => "collected_data", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/collected_data/new" }.should route_to(:controller => "collected_data", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/collected_data/1" }.should route_to(:controller => "collected_data", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/collected_data/1/edit" }.should route_to(:controller => "collected_data", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/collected_data" }.should route_to(:controller => "collected_data", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/collected_data/1" }.should route_to(:controller => "collected_data", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/collected_data/1" }.should route_to(:controller => "collected_data", :action => "destroy", :id => "1")
    end

  end
end

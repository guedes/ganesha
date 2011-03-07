require "spec_helper"

describe DataCollectorsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/data_collectors" }.should route_to(:controller => "data_collectors", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/data_collectors/new" }.should route_to(:controller => "data_collectors", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/data_collectors/1" }.should route_to(:controller => "data_collectors", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/data_collectors/1/edit" }.should route_to(:controller => "data_collectors", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/data_collectors" }.should route_to(:controller => "data_collectors", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/data_collectors/1" }.should route_to(:controller => "data_collectors", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/data_collectors/1" }.should route_to(:controller => "data_collectors", :action => "destroy", :id => "1")
    end

  end
end

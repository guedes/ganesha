require "spec_helper"

describe DatabasesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/databases" }.should route_to(:controller => "databases", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/databases/new" }.should route_to(:controller => "databases", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/databases/1" }.should route_to(:controller => "databases", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/databases/1/edit" }.should route_to(:controller => "databases", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/databases" }.should route_to(:controller => "databases", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/databases/1" }.should route_to(:controller => "databases", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/databases/1" }.should route_to(:controller => "databases", :action => "destroy", :id => "1")
    end

  end
end

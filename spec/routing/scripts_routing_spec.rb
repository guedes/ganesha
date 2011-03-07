require "spec_helper"

describe ScriptsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/scripts" }.should route_to(:controller => "scripts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/scripts/new" }.should route_to(:controller => "scripts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/scripts/1" }.should route_to(:controller => "scripts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/scripts/1/edit" }.should route_to(:controller => "scripts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/scripts" }.should route_to(:controller => "scripts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/scripts/1" }.should route_to(:controller => "scripts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/scripts/1" }.should route_to(:controller => "scripts", :action => "destroy", :id => "1")
    end

  end
end
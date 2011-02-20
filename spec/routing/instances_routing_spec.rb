require "spec_helper"

describe InstancesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/instances" }.should route_to(:controller => "instances", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/instances/new" }.should route_to(:controller => "instances", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/instances/1" }.should route_to(:controller => "instances", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/instances/1/edit" }.should route_to(:controller => "instances", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/instances" }.should route_to(:controller => "instances", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/instances/1" }.should route_to(:controller => "instances", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/instances/1" }.should route_to(:controller => "instances", :action => "destroy", :id => "1")
    end

  end
end

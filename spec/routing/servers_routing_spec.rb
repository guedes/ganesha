require "spec_helper"

describe ServersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/servers" }.should route_to(:controller => "servers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/servers/new" }.should route_to(:controller => "servers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/servers/1" }.should route_to(:controller => "servers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/servers/1/edit" }.should route_to(:controller => "servers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/servers" }.should route_to(:controller => "servers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/servers/1" }.should route_to(:controller => "servers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/servers/1" }.should route_to(:controller => "servers", :action => "destroy", :id => "1")
    end

  end
end

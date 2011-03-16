require "spec_helper"

describe ScriptTargetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/script_targets" }.should route_to(:controller => "script_targets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/script_targets/new" }.should route_to(:controller => "script_targets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/script_targets/1" }.should route_to(:controller => "script_targets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/script_targets/1/edit" }.should route_to(:controller => "script_targets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/script_targets" }.should route_to(:controller => "script_targets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/script_targets/1" }.should route_to(:controller => "script_targets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/script_targets/1" }.should route_to(:controller => "script_targets", :action => "destroy", :id => "1")
    end

  end
end

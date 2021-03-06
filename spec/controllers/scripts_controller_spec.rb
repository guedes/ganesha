require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ScriptsController do

  def mock_script(stubs={})
    @mock_script ||= mock_model(Script, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all scripts as @scripts" do
      Script.stub(:all) { [mock_script] }
      get :index
      assigns(:scripts).should eq([mock_script])
    end
  end

  describe "GET show" do
    it "assigns the requested script as @script" do
      Script.stub(:find).with("37") { mock_script }
      get :show, :id => "37"
      assigns(:script).should be(mock_script)
    end
  end

  describe "GET new" do
    it "assigns a new script as @script" do
      Script.stub(:new) { mock_script }
      get :new
      assigns(:script).should be(mock_script)
    end
  end

  describe "GET edit" do
    it "assigns the requested script as @script" do
      Script.stub(:find).with("37") { mock_script }
      get :edit, :id => "37"
      assigns(:script).should be(mock_script)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created script as @script" do
        Script.stub(:new).with({'these' => 'params'}) { mock_script(:save => true) }
        post :create, :script => {'these' => 'params'}
        assigns(:script).should be(mock_script)
      end

      it "redirects to the created script" do
        Script.stub(:new) { mock_script(:save => true) }
        post :create, :script => {}
        response.should redirect_to(script_url(mock_script))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved script as @script" do
        Script.stub(:new).with({'these' => 'params'}) { mock_script(:save => false) }
        post :create, :script => {'these' => 'params'}
        assigns(:script).should be(mock_script)
      end

      it "re-renders the 'new' template" do
        Script.stub(:new) { mock_script(:save => false) }
        post :create, :script => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested script" do
        Script.stub(:find).with("37") { mock_script }
        mock_script.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :script => {'these' => 'params'}
      end

      it "assigns the requested script as @script" do
        Script.stub(:find) { mock_script(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:script).should be(mock_script)
      end

      it "redirects to the script" do
        Script.stub(:find) { mock_script(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(script_url(mock_script))
      end
    end

    describe "with invalid params" do
      it "assigns the script as @script" do
        Script.stub(:find) { mock_script(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:script).should be(mock_script)
      end

      it "re-renders the 'edit' template" do
        Script.stub(:find) { mock_script(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested script" do
      Script.stub(:find).with("37") { mock_script }
      mock_script.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the scripts list" do
      Script.stub(:find) { mock_script }
      delete :destroy, :id => "1"
      response.should redirect_to(scripts_url)
    end
  end

end

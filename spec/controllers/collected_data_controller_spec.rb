require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe CollectedDataController do

  def mock_collected_datum(stubs={})
    @mock_collected_datum ||= mock_model(CollectedDatum, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all collected_data as @collected_data" do
      CollectedDatum.stub(:all) { [mock_collected_datum] }
      get :index
      assigns(:collected_data).should eq([mock_collected_datum])
    end
  end

  describe "GET show" do
    it "assigns the requested collected_datum as @collected_datum" do
      CollectedDatum.stub(:find).with("37") { mock_collected_datum }
      get :show, :id => "37"
      assigns(:collected_datum).should be(mock_collected_datum)
    end
  end

  describe "GET new" do
    it "assigns a new collected_datum as @collected_datum" do
      CollectedDatum.stub(:new) { mock_collected_datum }
      get :new
      assigns(:collected_datum).should be(mock_collected_datum)
    end
  end

  describe "GET edit" do
    it "assigns the requested collected_datum as @collected_datum" do
      CollectedDatum.stub(:find).with("37") { mock_collected_datum }
      get :edit, :id => "37"
      assigns(:collected_datum).should be(mock_collected_datum)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created collected_datum as @collected_datum" do
        CollectedDatum.stub(:new).with({'these' => 'params'}) { mock_collected_datum(:save => true) }
        post :create, :collected_datum => {'these' => 'params'}
        assigns(:collected_datum).should be(mock_collected_datum)
      end

      it "redirects to the created collected_datum" do
        CollectedDatum.stub(:new) { mock_collected_datum(:save => true) }
        post :create, :collected_datum => {}
        response.should redirect_to(collected_datum_url(mock_collected_datum))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved collected_datum as @collected_datum" do
        CollectedDatum.stub(:new).with({'these' => 'params'}) { mock_collected_datum(:save => false) }
        post :create, :collected_datum => {'these' => 'params'}
        assigns(:collected_datum).should be(mock_collected_datum)
      end

      it "re-renders the 'new' template" do
        CollectedDatum.stub(:new) { mock_collected_datum(:save => false) }
        post :create, :collected_datum => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested collected_datum" do
        CollectedDatum.stub(:find).with("37") { mock_collected_datum }
        mock_collected_datum.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :collected_datum => {'these' => 'params'}
      end

      it "assigns the requested collected_datum as @collected_datum" do
        CollectedDatum.stub(:find) { mock_collected_datum(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:collected_datum).should be(mock_collected_datum)
      end

      it "redirects to the collected_datum" do
        CollectedDatum.stub(:find) { mock_collected_datum(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(collected_datum_url(mock_collected_datum))
      end
    end

    describe "with invalid params" do
      it "assigns the collected_datum as @collected_datum" do
        CollectedDatum.stub(:find) { mock_collected_datum(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:collected_datum).should be(mock_collected_datum)
      end

      it "re-renders the 'edit' template" do
        CollectedDatum.stub(:find) { mock_collected_datum(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested collected_datum" do
      CollectedDatum.stub(:find).with("37") { mock_collected_datum }
      mock_collected_datum.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the collected_data list" do
      CollectedDatum.stub(:find) { mock_collected_datum }
      delete :destroy, :id => "1"
      response.should redirect_to(collected_data_url)
    end
  end

end
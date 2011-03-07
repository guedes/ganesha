require 'spec_helper'

describe ServersController do
  render_views

  describe "rendering" do
    before(:each) do
      @server = Factory(:server)
    end

    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      get :show, :id => @server
      response.should render_template(:show)
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

    it "edit action should render edit template" do
      get :edit, :id => @server
      response.should render_template(:edit)
    end
  end

  describe "GET show" do
    before(:each) do
      @server = Factory(:server)
    end

    it "should be successful" do
      get :show, :id => @server
      response.should be_success
    end

    it "should find the right server" do
      get :show, :id => @server
      assigns(:server).should == @server
    end

    it "should have the right title" do
      get :show, :id => @server
      response.should have_selector('title', :content => @server.name)
    end

    it "should have the server's name" do
      get :show, :id => @server
      response.should have_selector('h1', :content => @server.name)
    end

    it "should have the server's host_address and ip_address" do
      get :show, :id => @server
      response.should have_selector('h3', :content => @server.formatted_hostname)
    end
  end

  describe "POST create" do
    describe "failure" do
      before(:each) do
        @server = Factory.attributes_for(:server, :name => "")
      end

      it "should not create a server" do
        lambda { post :create, :server => @server }.should_not change(Server, :count)
      end

      it "should re-render server page" do
        post :create, :server => @server
        response.should render_template(:new)
      end

      it "should shows a failure error" do
        post :create, :server => @server

        response.should have_selector('h2', :content => '1 error prohibited this server from being saved:')

        assigns(:server).errors.full_messages.each do |msg| 
          response.should have_selector('li', :content => msg)
        end
      end
    end

    describe "success" do
      before(:each) do
        @server = Factory.attributes_for(:server)
      end

      it "should create a server" do
        lambda { post :create, :server => @server }.should change(Server, :count).by(1)
      end

      it "should redirect_to server page" do
        post :create, :server => @server
        response.should redirect_to(server_path(assigns(:server)))
      end

      it "should have a flash message" do
        post :create, :server => @server
        flash[:notice] = 'Server was successfully created'
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @server = Factory(:server)
    end

    describe "failure" do
      before(:each) do
        @server_attr = { :name => "", :description => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @server, :server => @server_attr
        response.should render_template(:edit)
      end
    end

    describe "success" do
      before(:each) do
        @server_attr = { :name => "My New Server Name", :description => "My cool description", :host_address => "www.uol.local" }
      end

      it "should change the server's attributes" do
        put :update, :id => @server, :server => @server_attr

        @server.reload

        @server.name.should         be_eql(@server_attr[:name])
        @server.description.should  be_eql(@server_attr[:description])
        @server.host_address.should be_eql(@server_attr[:host_address])
        @server.ip_address.should   be_eql(assigns(:server).ip_address)
      end

      it "should have a flash message" do
        @server_attr[:host_address] = "www.terra.local"
        put :update, :id => @server, :server => @server_attr
        flash[:notice].should =~ /successfully updated/
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @server = Factory(:server)
    end

    it "should destroy the server" do
      lambda do
        delete :destroy, :id => @server
      end.should change(Server, :count).by(-1)
    end

    it "should redirect to the servers page" do
      delete :destroy, :id => @server
      flash[:notice].should =~ /destroyed/i
      response.should redirect_to(servers_path)
    end
  end
end

require 'spec_helper'

describe InstancesController do
  render_views

  describe "rendering" do
    before(:each) do
      @instance = Factory(:instance)
    end

    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      get :show, :id => @instance
      response.should render_template(:show)
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

    it "edit action should render edit template" do
      get :edit, :id => @instance
      response.should render_template(:edit)
    end
  end

  describe "GET show" do
    before(:each) do
      @instance = Factory(:instance)
    end

    it "should be successful" do
      get :show, :id => @instance
      response.should be_success
    end

    it "should find the right instance" do
      get :show, :id => @instance
      @instance.name = "Shoud"
      assigns(:instance).should be_eql(@instance)
    end

    it "should have the right title" do
      get :show, :id => @instance
      response.should have_selector('title', :content => @instance.name)
    end

    it "should have the instance's name" do
      get :show, :id => @instance
      response.should have_selector('h1', :content => @instance.name)
    end

    it "should have the instance's port" do
      get :show, :id => @instance
      response.should have_selector('h3', :content => @instance.formatted_port)
    end
  end

  describe "POST create" do
    describe "failure" do
      before(:each) do
        @instance = Factory.attributes_for(:instance, :name => "")
      end

      it "should not create a instance" do
        lambda { post :create, :instance => @instance }.should_not change(Instance, :count)
      end

      it "should re-render instance page" do
        post :create, :instance => @instance
        response.should render_template(:new)
      end

      it "should shows a failure error" do
        post :create, :instance => @instance

        response.should have_selector('h2', :content => "prohibited" )

        assigns(:instance).errors.full_messages.each do |msg| 
          response.should have_selector('li', :content => msg)
        end
      end
    end

    describe "success" do
      before(:each) do
        @server = Factory(:server)
        @instance = Factory.attributes_for(:instance, :server => @server)
      end

      it "should create a instance" do
        lambda { post :create, :instance => @instance }.should change(Instance, :count).by(1)
      end

      it "should redirect_to instance page" do
        post :create, :instance => @instance
        response.should redirect_to(instance_path(assigns(:instance)))
      end

      it "should have a flash message" do
        post :create, :instance => @instance
        flash[:notice] = 'Instance was successfully created'
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @instance = Factory(:instance)
    end

    describe "failure" do
      before(:each) do
        @instance_attr = { :name => nil, :description => nil }
      end

      it "should render the 'edit' page" do
        put :update, :id => @instance, :instance => @instance_attr
        response.should render_template(:edit)
      end
    end

    describe "success" do
      before(:each) do
        @instance_attr = { :name => "My New Instance Name", :description => "My cool description", :port => 5433 }
      end

      it "should change the instance's attributes" do
        put :update, :id => @instance, :instance => @instance_attr

        @instance.reload

        @instance.name.should be_eql(@instance_attr[:name])
        @instance.description.should be_eql(@instance_attr[:description])
        @instance.port.should be_eql(@instance_attr[:port])
      end

      it "should have a flash message" do
        put :update, :id => @instance, :instance => @instance_attr
        flash[:notice].should =~ /successfully updated/
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @instance = Factory(:instance)
    end

    it "should destroy the instance" do
      lambda do
        delete :destroy, :id => @instance
      end.should change(Instance, :count).by(-1)
    end

    it "should redirect to the instances page" do
      delete :destroy, :id => @instance
      flash[:notice].should =~ /destroyed/i
      response.should redirect_to(instances_path)
    end
  end

end

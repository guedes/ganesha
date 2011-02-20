require 'spec_helper'

describe Instance do

  it "should validates presence of name, description and server" do
    instance = Factory.build(:instance, :name => nil, :description => "", :server => nil)

    instance.should have(1).error_on(:name)
    instance.should have(1).error_on(:description)
    instance.should have(1).error_on(:server)
  end

  it "should validates integer port number" do
    instance = Factory.build(:instance, :port => "text")

    # two erros here because there two test
    # to fail:
    #  validates_inclusion_of
    #  validates_numericality_of
    #
    instance.should have(1).error_on(:port)
  end
  
  it "should accepts a correct integer port number or nill" do
    instance_with_valid_port = Factory.build(:instance, :port => 5432)
    instance_with_nil_port = Factory.build(:instance, :port => nil)

    instance_with_valid_port.should be_valid
    instance_with_nil_port.should be_valid
  end

  it "should set port to default when port is nil" do
    pending
    instance_with_nil_port = Factory.build(:instance, :port => nil)
    instance_with_nil_port.save!
    instance_with_nil_port.reload

    instance_with_nil_port.port.should == 5432
  end

  it "should validates for non-reserved port-numbers" do
    instance_with_low_port = Factory.build(:instance, :port => 10)
    instance_with_higher_port = Factory.build(:instance, :port => 999999)

    instance_with_low_port.should have(1).error_on(:port)
    instance_with_higher_port.should have(1).error_on(:port)
  end

  it "should require a unique name" do
    instance = Factory.build(:instance, :name => "foo" )
    instance_with_duplicate_name = Factory.build(:instance, :name => "foo" )

    instance.save!

    instance_with_duplicate_name.should_not be_valid
    instance_with_duplicate_name.should have(1).error_on(:name)
  end

  it "should shows a formatted 'hostname:port' for port" do
    instance = Factory(:instance)

    instance.formatted_port.should == "#{instance.server.host_address}:#{instance.port}"
  end
end

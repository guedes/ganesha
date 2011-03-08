require 'spec_helper'

describe DataCollector do

  it "should validates presence of database if server is not given" do
    data_collector = Factory(:data_collector, :server_id => nil)
    data_collector_without_server_and_database = Factory.build(:data_collector, :server_id => nil, :database_id => nil)

    data_collector.should be_valid
    data_collector_without_server_and_database.should have(1).error_on(:database_id)
  end

  it "should validates presence of server only if database is not given" do
    data_collector_without_server = Factory(:data_collector, :server_id => nil)
    data_collector_without_server_and_database = Factory.build(:data_collector, :server_id => nil, :database_id => nil)

    data_collector_without_server.should be_valid
    data_collector_without_server_and_database.should have(1).error_on(:server_id)
  end

  it "should return a default name if none is given" do
    data_collector_without_name = Factory(:data_collector, :name => nil)
    data_collector = Factory(:data_collector, :name => "my_special_name")
    expected_default_name = "#{data_collector_without_name.script.name} of #{data_collector_without_name.database.name}"

    data_collector_without_name.name.should be_eql(expected_default_name)
    data_collector.name.should be_eql("my_special_name")
  end

  it "should require at least a unique name" do
    pending "Use this really?"
    #data_collector = Factory(:data_collector, :name => "test")
    #data_collector_with_duplicate_name = Factory.build(:data_collector, :name => "test")

    #data_collector_with_duplicate_name.should_not be_valid
  end
end

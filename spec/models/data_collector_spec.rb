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

  it "should require at least a unique name" do
    pending "User this really?"
    #data_collector = Factory(:data_collector, :name => "test")
    #data_collector_with_duplicate_name = Factory.build(:data_collector, :name => "test")

    #data_collector_with_duplicate_name.should_not be_valid
  end

end

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

  it "should return a default name" do
    data_collector = Factory(:data_collector)
    expected_default_name = "#{data_collector.script.name} of #{data_collector.database.name}"

    data_collector.name.should be_eql(expected_default_name)
  end

end

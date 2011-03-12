require 'spec_helper'

describe DataCollector do

  it "should validates presence of target" do
    valid_data_collector = Factory(:data_collector)
    invalid_data_collector = Factory.build(:data_collector, :targetable => nil)

    valid_data_collector.should be_valid
    invalid_data_collector.should_not be_valid
  end

  it "should validates presence of script" do
    data_collector_without_script = Factory.build(:data_collector, :script => nil)

    data_collector_without_script.should_not be_valid
  end

  it "should saves the correct object for targetable" do
    data_collector = Factory(:data_collector)
    data_collector.targetable_type.should be_eql("Database")
  end

  it "should return a default name" do
    data_collector = Factory(:data_collector)
    expected_default_name = "#{data_collector.script.name} of #{data_collector.targetable.name}"

    data_collector.name.should be_eql(expected_default_name)
  end

end

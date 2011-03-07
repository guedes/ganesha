require 'spec_helper'

describe DataCollector do
  it "should validates presence of name, description and script" do
    data_collector = Factory.build(:data_collector, :name => nil, :description => "", :script => nil)

    data_collector.should have(1).error_on(:name)
    data_collector.should have(1).error_on(:description)
    data_collector.should have(1).error_on(:script)
  end

  it "should require a unique name"  do
    data_collector = Factory(:data_collector, :name => "test")
    data_collector_with_duplicate_name = Factory.build(:data_collector, :name => "test")

    data_collector_with_duplicate_name.should_not be_valid
  end

end

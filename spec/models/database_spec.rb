require 'spec_helper'

describe Database do
  it "should validates presence of name, description" do
    database = Factory.build(:database, :name => nil, :description => "")

    database.should have(1).error_on(:name)
    database.should have(1).error_on(:description)
  end

  it "should require a unique name per instance"  do
    database = Factory(:database, :name => "test")
    database_with_duplicate_name = Factory.build(:database, :name => "test")
    database_with_duplicate_name_and_instance = Factory.build(:database, :name => "test", :instance => database.instance)

    database_with_duplicate_name.should be_valid
    database_with_duplicate_name_and_instance.should_not be_valid
  end
  
  it "should shows a formatted jdbc string" do
    database = Factory(:database)

    database.formatted_jdbc_string.should == "jdbc:postgresql://#{database.instance.server.host_address}:#{database.instance.port}/#{database.name}"
  end
end

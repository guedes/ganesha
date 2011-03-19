require 'spec_helper'

describe ScriptTarget do

  it "should validates presence of target" do
    valid_script_target = Factory(:script_target)
    invalid_script_target = Factory.build(:script_target, :targetable => nil)

    valid_script_target.should be_valid
    invalid_script_target.should_not be_valid
  end

  it "should validates presence of script" do
    script_target_without_script = Factory.build(:script_target, :script => nil)

    script_target_without_script.should_not be_valid
  end

  it "should validates uniqueness of script scoped by target" do
    script_target = Factory(:script_target)
    script_target_duplicated = Factory.build(:script_target, :script => script_target.script, :targetable => script_target.targetable)

    script_target.should be_valid
    script_target_duplicated.should_not be_valid
    script_target_duplicated.should have(1).error_on(:script_id)
  end

  it "should saves the correct object for targetable" do
    script_target = Factory(:script_target)
    script_target.targetable_type.should be_eql("Database")
  end

  it "should return a default name" do
    script_target = Factory(:script_target)
    expected_default_name = "#{script_target.script.name} on #{script_target.targetable.name}"

    script_target.name.should be_eql(expected_default_name)
  end

  it "should accepts a targetable_attributes and associate it correctly" do
    database = Factory(:database)
    instance = Factory(:instance)

    script_target_database = Factory(:script_target)
    script_target_instance = Factory(:script_target_instance)

    script_target_database.targetable.should_not be_eql(database)
    script_target_instance.targetable.should_not be_eql(instance)

    script_target_database.targetable_attributes = {"targetable_type"=>"database", "targetable_id"=>database.id}

    script_target_instance.targetable_attributes = {"targetable_type"=>"instance", "targetable_id"=>instance.id}

    script_target_database.targetable.should be_eql(database)
    script_target_instance.targetable.should be_eql(instance)

    script_target_database.should be_valid
    script_target_instance.should be_valid
  end

end

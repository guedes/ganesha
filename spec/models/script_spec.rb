require 'spec_helper'

describe Script do
  it "should validates presence of name, description and script" do
    script = Factory.build(:script, :name => nil, :description => "", :script => nil)

    script.should have(1).error_on(:name)
    script.should have(1).error_on(:description)
    script.should have(1).error_on(:script)
  end

  it "should require a unique name"  do
    script = Factory(:script, :name => "test")
    script_with_duplicate_name = Factory.build(:script, :name => "test")

    script_with_duplicate_name.should_not be_valid
  end
end

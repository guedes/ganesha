require 'spec_helper'

describe Script do
  it "should validates presence of name, description and content" do
    script = Factory.build(:script, :name => nil, :description => "", :content => nil)

    script.should have(1).error_on(:name)
    script.should have(1).error_on(:description)
    script.should have(1).error_on(:content)
  end

  it "should require a unique name"  do
    script = Factory(:script, :name => "test")
    script_with_duplicate_name = Factory.build(:script, :name => "test")

    script_with_duplicate_name.should_not be_valid
  end

  it "should recognize the type of script by slash bang" do
    bash_script = Factory.build(:script, :content => "#!/bin/bash\necho Hello")
    ruby_script = Factory.build(:script, :content => "#!/bin/env ruby\n10.times { puts 'Hello' }")
    sql_script  = Factory(:script)
    sql_script_starting_with_space = Factory(:script, :content => "    SELECT 2+2")

    bash_script.type.should be_eql(ScriptType::BASH)
    ruby_script.type.should be_eql(ScriptType::RUBY)
    sql_script.type.should be_eql(ScriptType::SQL)
    sql_script_starting_with_space.type.should be_eql(ScriptType::SQL)
  end
end

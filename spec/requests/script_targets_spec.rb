require 'spec_helper'

describe "ScriptTargets" do
  describe "GET /script_targets" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get script_targets_path
      response.status.should be(200)
    end
  end
end

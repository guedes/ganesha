class CollectedDatum < ActiveRecord::Base
  belongs_to :script_target, :include => true
  serialize :result

  validates_presence_of :script_target
end

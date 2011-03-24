class CollectedDatum < ActiveRecord::Base
  belongs_to :script_target
  serialize :result

  validates_presence_of :script_target
end

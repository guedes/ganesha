class DataCollector < ActiveRecord::Base
  belongs_to :script
  belongs_to :targetable, :polymorphic => true

  validates_presence_of :script, :targetable

  def name
    "#{script.name} of #{targetable.name}"
  end
end

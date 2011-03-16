class ScriptTarget < ActiveRecord::Base
  belongs_to :script
  belongs_to :targetable, :polymorphic => true

  validates_presence_of :script

  delegate :name, :to => :script, :prefix => true
  delegate :name, :to => :targetable, :prefix => true

  def name
    "#{script_name} of #{targetable_name}"
  end
end

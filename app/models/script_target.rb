class ScriptTarget < ActiveRecord::Base
  belongs_to :script
  belongs_to :targetable, :polymorphic => true

  validates_presence_of :script, :targetable

  validates_uniqueness_of :script_id, :scope => [ :targetable_id, :targetable_type ]

  delegate :name, :to => :script, :prefix => true
  delegate :name, :to => :targetable, :prefix => true
  
  def name
    "#{script_name} on #{targetable_name}"
  end

  def targetable_attributes=(targetable_attributes)
     target_class = targetable_attributes.keys.first.classify.constantize
     target_id    = targetable_attributes.values.first.to_i
     self.targetable   = target_class.find(target_id)
  end

end

class ScriptTarget < ActiveRecord::Base
  belongs_to :script, :include => true
  belongs_to :targetable, :polymorphic => true

  has_many :collected_data, :dependent => :destroy, :include => true

  validates_presence_of :script, :targetable

  validates_uniqueness_of :script_id, :scope => [ :targetable_id, :targetable_type ]

  delegate :name, :type, :to => :script, :prefix => true
  delegate :name, :to => :targetable, :prefix => true

  def name
    "#{script_name} on #{targetable_name}"
  end

  def targetable_attributes=(targetable_attributes)
    unless targetable_attributes['targetable_id'].empty? or targetable_attributes['targetable_type'].empty?
      target_class = targetable_attributes['targetable_type'].classify.constantize
      target_id    = targetable_attributes['targetable_id'].to_i
      self.targetable   = target_class.find(target_id)
    end
  end
end

class Script < ActiveRecord::Base
  has_many :data_collectors, :dependent => :destroy

  #accepts_nested_attributes_for :data_collectors

  validates_presence_of :name, :description, :script
  validates_uniqueness_of :name

  def type
   ScriptType.constants.each do |constant|
     return ScriptType.const_get(constant) if self.script =~ ScriptType.const_get(constant)
   end
  end
end

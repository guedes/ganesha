class Script < ActiveRecord::Base
  has_many :script_targets, :dependent => :destroy

  #accepts_nested_attributes_for :script_targets

  validates_presence_of :name, :description, :content
  validates_uniqueness_of :name

  def type
   ScriptType.constants.each do |constant|
     return ScriptType.const_get(constant) if self.content =~ ScriptType.const_get(constant)
   end
  end

  def self.type_is(type)
    #TODO: refactor
    #OPTIMIZE: maybe create an attribute 'type' in script
    type = ScriptType::SQL unless type
    order(:name).select { |script| script.type == type }
  end

  def self.type_is_not(type)
    #TODO: refactor
    #OPTIMIZE: maybe create an attribute 'type' in script
    type = ScriptType::SQL unless type
    order(:name).select { |script| script.type != type }
  end
end

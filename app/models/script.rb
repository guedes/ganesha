class Script < ActiveRecord::Base
  validates_presence_of :name, :description, :script
  validates_uniqueness_of :name
end

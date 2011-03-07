class Script < ActiveRecord::Base
  has_many :data_collectors
  has_many :databases, :through => :data_collectors
  has_many :servers, :through => :data_collectors

  validates_presence_of :name, :description, :script
  validates_uniqueness_of :name
end

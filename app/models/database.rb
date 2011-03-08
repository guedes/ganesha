class Database < ActiveRecord::Base
  belongs_to :instance
  has_many :data_collectors
  has_many :scripts, :through => :data_collectors

  validates_presence_of :name, :description
  validates_uniqueness_of :name,  :scope => :instance_id

  def formatted_jdbc_string
    "jdbc:postgresql://#{instance.server.host_address}:#{instance.port}/#{name}"
  end
end

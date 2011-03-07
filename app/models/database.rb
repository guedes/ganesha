class Database < ActiveRecord::Base
  has_many :data_collectors
  has_many :scripts, :through => :data_collectors
  belongs_to :instance

  validates_presence_of :name, :description
  validates_uniqueness_of :name,  :scope => :instance_id

  def formatted_jdbc_string
    "jdbc:postgresql://#{instance.server.host_address}:#{instance.port}/#{name}"
  end
end

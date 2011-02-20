class Instance < ActiveRecord::Base
  belongs_to :server

  validates_uniqueness_of :name
  validates_presence_of :name, :description, :server
  validates_inclusion_of :port, :in => 1024..65535, :allow_nil => true

  def formatted_port
    "#{server.host_address}:#{port}"
  end
end

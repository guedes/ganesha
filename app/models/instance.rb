class Instance < ActiveRecord::Base
  belongs_to :server
  has_many :databases, :dependent => :destroy
  has_many :script_targets, :as => :targetable

  validates_uniqueness_of :name
  validates_presence_of :name, :description, :server
  validates_inclusion_of :port, :in => 1024..65535, :allow_nil => true

  def formatted_port
    "#{server.host_address}:#{port}"
  end
end

class DataCollector < ActiveRecord::Base
  belongs_to :database
  belongs_to :server
  belongs_to :script

  validates_presence_of :script_id
  validates_presence_of :server_id, :unless => :database_id
  validates_presence_of :database_id, :unless => :server_id

  def name
    "#{script.name} of #{database.name}"
  end
end

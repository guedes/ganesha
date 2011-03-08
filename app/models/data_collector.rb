class DataCollector < ActiveRecord::Base
  belongs_to :database
  belongs_to :server
  belongs_to :script

  before_save :format_name

  validates_presence_of :script_id
  validates_presence_of :server_id, :unless => :database_id
  validates_presence_of :database_id, :unless => :server_id

  def formatted_name
    "#{script.name} of #{database.name}"
  end

  private
  def format_name
    self.name = formatted_name if self.name.nil?
  end

end

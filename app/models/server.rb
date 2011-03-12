class Server < ActiveRecord::Base
  has_many :instances
  has_many :data_collectors, :as => :targetable
  has_many :scripts, :through => :data_collectors
  
  before_save :populate_ip_address

  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :host_address, :presence => true, :uniqueness => true

  def formatted_hostname
    "#{host_address} (#{ip_address})"
  end

  # TODO: alive is a good name? it should be a ICMP.echo
  # but for this it must runs as root. :(
  def alive?
    listening_on? 5432
  end

  def listening_on?(port)
    Net::Ping::TCP.new(host_address, port).ping?
  end

  private
  def populate_ip_address
    self.ip_address = IPSocket.getaddress self.host_address
  end

end

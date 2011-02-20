class AddIpAddressToServer < ActiveRecord::Migration
  def self.up
    add_column :servers, :ip_address, :string
  end

  def self.down
    remove_columns :servers, :ip_address
  end
end

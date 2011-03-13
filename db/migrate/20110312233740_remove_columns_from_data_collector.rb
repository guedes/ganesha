class RemoveColumnsFromDataCollector < ActiveRecord::Migration
  def self.up
    remove_column :data_collectors, :server_id
    remove_column :data_collectors, :database_id
  end

  def self.down
    add_column :data_collectors, :server_id
    add_column :data_collectors, :database_id
  end
end

class AddDatabaseToDataCollector < ActiveRecord::Migration
  def self.up
    add_column :data_collectors, :database_id, :integer
  end

  def self.down
    remove_column :data_collectors, :database_id
  end
end

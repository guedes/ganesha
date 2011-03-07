class AddingReferencesToDataCollectors < ActiveRecord::Migration
  def self.up
    remove_column :data_collectors, :script
    add_column :data_collectors, :script_id, :integer
    add_column :data_collectors, :server_id, :integer

    add_index :data_collectors, :script_id
    add_index :data_collectors, :server_id
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the script column on data_collectors"
  end
end

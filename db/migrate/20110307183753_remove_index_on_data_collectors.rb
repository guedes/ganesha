class RemoveIndexOnDataCollectors < ActiveRecord::Migration
  def self.up
    remove_index :data_collectors, :name
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't recover this, name should not be unique"
  end
end

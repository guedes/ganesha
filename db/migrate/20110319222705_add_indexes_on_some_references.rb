class AddIndexesOnSomeReferences < ActiveRecord::Migration
  def self.up
    add_index :instances, :server_id
    add_index :script_targets, [ :targetable_id, :targetable_type ]
  end

  def self.down
    remove_index :instances, :server_id
    remove_index :script_targets, [ :targetable_id, :targetable_type ]
  end
end

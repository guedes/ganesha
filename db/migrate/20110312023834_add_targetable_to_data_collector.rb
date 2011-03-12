class AddTargetableToDataCollector < ActiveRecord::Migration
  def self.up
    add_column :data_collectors, :targetable_id, :integer
    add_column :data_collectors, :targetable_type, :string
  end

  def self.down
    remove_column :data_collectors, :targetable_type
    remove_column :data_collectors, :targetable_id
  end
end

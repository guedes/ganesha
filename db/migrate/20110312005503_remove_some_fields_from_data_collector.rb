class RemoveSomeFieldsFromDataCollector < ActiveRecord::Migration
  def self.up
    remove_column :data_collectors, :name
    remove_column :data_collectors, :unit
    remove_column :data_collectors, :description
  end

  def self.down
    add_column :data_collectors, :name, :string
    add_column :data_collectors, :unit, :string
    add_column :data_collectors, :description, :string
  end
end

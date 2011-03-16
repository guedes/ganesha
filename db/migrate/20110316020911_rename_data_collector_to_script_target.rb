class RenameDataCollectorToScriptTarget < ActiveRecord::Migration
  def self.up
    rename_table :data_collectors, :script_targets
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't recover this, all references should be edited."
  end
end

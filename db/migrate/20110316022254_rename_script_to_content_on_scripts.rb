class RenameScriptToContentOnScripts < ActiveRecord::Migration
  def self.up
    rename_column :scripts, :script, :content
  end

  def self.down
    rename_column :scripts, :content, :script 
  end
end

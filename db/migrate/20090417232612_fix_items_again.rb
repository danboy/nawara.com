class FixItemsAgain < ActiveRecord::Migration
  def self.up
    rename_column :items, :type, :service
  end

  def self.down
    rename_column :items, :service, :type
  end
end

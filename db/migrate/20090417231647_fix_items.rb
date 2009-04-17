class FixItems < ActiveRecord::Migration
  def self.up
    add_column :items, :type, :string
  end

  def self.down
    remove_column :items, :type
  end
end

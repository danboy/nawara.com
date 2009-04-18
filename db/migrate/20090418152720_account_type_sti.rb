class AccountTypeSti < ActiveRecord::Migration
  def self.up
    add_column :items, :type, :string
  end

  def self.down
    drop_column :items, :type
  end
end

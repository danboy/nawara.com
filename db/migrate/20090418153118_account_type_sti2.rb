class AccountTypeSti2 < ActiveRecord::Migration
  def self.up
    remove_column :items, :type
  end

  def self.down
    add_column :items, :type, :string
  end
end

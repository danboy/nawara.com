class FixAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :user_id, :integer
  end

  def self.down
    drop_column :accounts, :user_id
  end
end

class FixProfile < ActiveRecord::Migration
  def self.up
    change_column :profiles, :phone_number, :string
  end

  def self.down
    change_column :profiles, :phone_number, :integer
  end
end

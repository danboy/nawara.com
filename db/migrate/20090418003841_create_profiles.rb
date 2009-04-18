class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.text :description
      t.date :birthday
      t.integer :phone_number
      t.text :address1
      t.text :address2
      t.text :city
      t.text :state
      t.integer :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end

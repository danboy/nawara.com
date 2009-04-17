class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :user_id
      t.datetime :created_at
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

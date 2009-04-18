class SetupPaperclip < ActiveRecord::Migration
  def self.up
    add_column :profiles, :avatar_file_name, :string
    add_column :profiles, :avatar_content_type, :string
    add_column :profiles, :avatar_file_size, :integer

  end

  def self.down
    drop_column :profiles, :avatar_file_name
    drop_column :profiles, :avatar_content_type
    drop_column :profiles, :avatar_file_size
  end
end

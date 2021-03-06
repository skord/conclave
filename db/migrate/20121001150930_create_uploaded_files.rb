class CreateUploadedFiles < ActiveRecord::Migration
  def up
    create_table :uploaded_files do |t|
      t.integer   :comment_id
      t.string    :file_file_name
      t.string    :file_content_type
      t.integer   :file_file_size
      t.timestamp :file_updated_at
    end

    add_index :uploaded_files, :comment_id
  end

  def down
    remove_index :uploaded_files, :column => :comment_id
    drop_table :uploaded_files
  end
end

class CreatePictureTags < ActiveRecord::Migration[5.1]
  def change
    create_table :picture_tags do |t|
      t.integer :picture_id
      t.integer :tag_id

      t.timestamps
    end
  end
end

class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.string :image_name
      t.integer :position
      t.boolean :archived
      t.string :call_to_action
      t.string :link

      t.timestamps
    end
  end
end

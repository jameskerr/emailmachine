class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.string :link
      t.text :description
      t.integer :position
      t.string :image_name

      t.timestamps
    end
  end
end

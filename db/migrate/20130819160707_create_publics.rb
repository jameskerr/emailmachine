class CreatePublics < ActiveRecord::Migration
  def change
    create_table :publics do |t|
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end

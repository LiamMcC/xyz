class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :image
      t.string :description
      t.string :alt
      t.integer :position

      t.timestamps
    end
  end
end

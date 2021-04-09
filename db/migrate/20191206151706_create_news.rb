class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.string :image1
      t.string :image2
      t.integer :position
      t.boolean :on

      t.timestamps
    end
  end
end

class CreatePromos < ActiveRecord::Migration[6.0]
  def change
    create_table :promos do |t|
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

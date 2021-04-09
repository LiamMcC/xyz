class CreateSiteInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :site_infos do |t|
      t.integer :position
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :image
      t.string :image2

      t.timestamps
    end
  end
end

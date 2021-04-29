class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end

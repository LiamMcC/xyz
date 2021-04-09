class CreateOpeningTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :opening_times do |t|
      t.string :day
      t.string :from
      t.string :to
      t.boolean :on

      t.timestamps
    end
  end
end

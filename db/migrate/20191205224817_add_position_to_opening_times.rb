class AddPositionToOpeningTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :opening_times, :position, :integer
  end
end

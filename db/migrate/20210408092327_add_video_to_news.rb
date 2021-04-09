class AddVideoToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :video, :string
  end
end

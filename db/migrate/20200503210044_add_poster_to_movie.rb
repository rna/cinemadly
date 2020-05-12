class AddPosterToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :poster, :string
  end
end

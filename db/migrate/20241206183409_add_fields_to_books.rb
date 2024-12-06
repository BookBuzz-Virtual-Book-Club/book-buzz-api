class AddFieldsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :image_data, :string
    add_column :books, :url, :string
  end
end

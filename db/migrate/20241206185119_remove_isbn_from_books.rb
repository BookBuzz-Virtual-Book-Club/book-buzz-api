class RemoveIsbnFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :isbn
  end
end

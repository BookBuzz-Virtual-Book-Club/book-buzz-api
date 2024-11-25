class CreateUserBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :bookshelf_id
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end

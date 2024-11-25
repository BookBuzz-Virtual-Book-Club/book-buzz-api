class CreateBookClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :book_clubs do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

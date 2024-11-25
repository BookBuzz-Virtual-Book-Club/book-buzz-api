class CreateDiscussionBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :discussion_boards do |t|
      t.string :name
      t.integer :book_club_id

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :discussion_board_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end

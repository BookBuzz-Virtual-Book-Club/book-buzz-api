class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :image_data
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end

class ChangePublicationDateToStringInBooks < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :publication_date, :string
  end
end

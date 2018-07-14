class AddReaderIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :reader_id, :string
  end
end

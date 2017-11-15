class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :due_date, :date
  end
end

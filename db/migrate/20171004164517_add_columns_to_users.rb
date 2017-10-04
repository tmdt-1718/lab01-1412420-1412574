class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :group, index: true
    add_column :users, :student_id, :string
  end
end

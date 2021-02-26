class AddUseridToRemind < ActiveRecord::Migration[6.1]
  def change
    add_column :reminds, :user_id, :integer
  end
end

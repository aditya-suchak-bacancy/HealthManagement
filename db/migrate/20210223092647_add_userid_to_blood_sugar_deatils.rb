class AddUseridToBloodSugarDeatils < ActiveRecord::Migration[6.1]
  def change
    add_column :blood_sugar_details, :user_id, :integer
  end
end

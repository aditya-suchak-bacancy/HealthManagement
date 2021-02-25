class AddUseridToBloodPressureDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :blood_pressure_details, :user_id, :integer
  end
end

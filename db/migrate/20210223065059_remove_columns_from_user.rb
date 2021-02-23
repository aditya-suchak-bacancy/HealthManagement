class RemoveColumnsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :blood_pressure, :integer
    remove_column :users, :blood_presssure_date, :date
    remove_column :users, :blood_sugar, :integer
    remove_column :users, :blood_sugar_date, :date
  end
end

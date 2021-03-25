class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :weight, :decimal
    add_column :users, :height, :decimal
    add_column :users, :bmi, :decimal
    add_column :users, :blood_pressure, :integer
    add_column :users, :blood_pressure_date, :date
    add_column :users, :blood_sugar, :integer
    add_column :users, :blood_sugar_date, :date
  end
end

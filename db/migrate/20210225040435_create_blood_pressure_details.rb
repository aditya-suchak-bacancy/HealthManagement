class CreateBloodPressureDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :blood_pressure_details do |t|
      t.integer :s_blood_pressure
      t.integer :d_blood_pressure
      t.date :blood_pressure_date

      t.timestamps
    end
  end
end

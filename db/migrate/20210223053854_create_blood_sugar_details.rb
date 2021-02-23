class CreateBloodSugarDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :blood_sugar_details do |t|
      t.decimal :blood_sugar
      t.date :blood_sugar_date

      t.timestamps
    end
  end
end

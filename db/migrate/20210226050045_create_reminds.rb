class CreateReminds < ActiveRecord::Migration[6.1]
  def change
    create_table :reminds do |t|
      t.string :remid_type
      t.date :remind_date

      t.timestamps
    end
  end
end

class CreateTimesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :timesheets do |t|
      t.text :description
      t.string :total_time
      t.string :rate
      t.string :total_cost
      
      t.timestamps
    end
  end
end

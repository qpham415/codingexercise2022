class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.date :date
      t.string :minutes
      t.references :timesheet, foreign_key: true

      t.timestamps
    end
  end
end

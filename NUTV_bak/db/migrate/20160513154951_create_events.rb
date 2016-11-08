class CreateEvents < ActiveRecord::Migration 
   def change
    create_table :events do |t|
      t.date :date
      t.time :starttime
      t.time :endtime
      t.string :kind
      t.text :equipment, array: true, default: []
      t.references :project
      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :startminute
      t.integer :endhour
      t.integer :endminute
      t.integer :day
      t.integer :month
      t.integer :year
      t.references :project
      t.timestamps
    end
  end
end

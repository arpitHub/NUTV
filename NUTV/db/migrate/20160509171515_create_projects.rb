class CreateProjects < ActiveRecord::Migration 
  def change
    create_table :projects do |t|
      t.text :name
      t.text :director
      t.text :ep
      t.text :equipment, array: true, default: []
      t.text :notes
      t.string :status
      t.string :department
      t.string :dates
      t.timestamps
    end
  end
end

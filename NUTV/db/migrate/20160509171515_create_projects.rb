class CreateProjects < ActiveRecord::Migration 
  def change
    create_table :projects do |t|
      t.text :name
      t.text :director
      t.text :ep
      t.text :notes
      t.string :status
      t.string :department
      t.string :dates
      t.timestamps
    end
  end
end

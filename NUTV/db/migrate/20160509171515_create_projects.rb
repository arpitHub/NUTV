class CreateProjects < ActiveRecord::Migration 
  def change
    create_table :projects do |t|
      t.text :name
      t.references :user1
      t.references :user2
      t.text :notes
      t.string :status
      t.string :department
      t.string :dates
      t.integer :updatedby
      t.string :department
      t.string :emailchain
      t.timestamps
    end
  end
end

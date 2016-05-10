class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :name
      t.text :director
      t.text :ep
      t.text :equipment
      t.text :dates
      t.text :status
      t.text :department
      t.timestamps
    end
  end
end

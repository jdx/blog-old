class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.string :url
      t.text :body

      t.timestamps
    end
  end
end

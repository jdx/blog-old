class DbUpdate < ActiveRecord::Migration
  def change
    add_column :posts, :description, :text
    add_column :posts, :thumbnail, :string
    add_column :posts, :datetime, :datetime
    add_column :posts, :draft, :boolean
    add_index :posts, :datetime
  end
end

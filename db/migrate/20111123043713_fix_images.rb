class FixImages < ActiveRecord::Migration
  def change
    remove_column :posts, :thumbnail
    add_column :posts, :image, :string
  end
end

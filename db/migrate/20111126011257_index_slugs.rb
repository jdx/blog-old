class IndexSlugs < ActiveRecord::Migration
  def change
    add_index :projects, :slug, unique: true
    add_index :posts, :slug, unique: true
  end
end

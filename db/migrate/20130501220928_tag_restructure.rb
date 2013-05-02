class TagRestructure < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute %q{ALTER TABLE "posts" ADD COLUMN tags varchar(255)[] DEFAULT ARRAY[]::varchar(255)[] NOT NULL}
    ActiveRecord::Base.connection.execute(%q{SELECT taggable_id, name FROM taggings JOIN tags ON tags.id = tag_id}).each do |tag|
      post = Post.find(tag["taggable_id"])
      tags = post.tags
      post.tags = tags + [tag["name"]]
      post.save!
    end
    Post.find_each do |p|
      ap p.tags
    end
  end

  def down
    remove_column :posts, :tags
  end
end

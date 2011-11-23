class RemovePostDescription < ActiveRecord::Migration
  def up
    remove_column :posts, :description
  end

  def down
  end
end

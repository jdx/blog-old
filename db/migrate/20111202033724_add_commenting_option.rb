class AddCommentingOption < ActiveRecord::Migration
  def change
    add_column :posts, :commenting, :string, default: 'disqus', null: false
  end
end

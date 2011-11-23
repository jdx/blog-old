class ChangeDate < ActiveRecord::Migration
  def change
    add_column :posts, :post_date, :date
    add_index :posts, :post_date
    remove_column :posts, :datetime
  end
end

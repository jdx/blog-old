class ChangeDate < ActiveRecord::Migration
  def change
    add_column :posts, :post_date, :date
    remove_column :posts, :datetime
  end
end

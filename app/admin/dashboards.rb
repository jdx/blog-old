ActiveAdmin::Dashboards.build do
  section "Recent Posts" do
    table_for Post.recent(5).collect do
      column :name do |post|
        link_to(post, admin_post_path(post))
      end
      column :post_date
    end
  end
end

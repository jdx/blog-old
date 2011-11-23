ActiveAdmin::Dashboards.build do
  section "Recent Posts" do
    ul do
      Post.recent(5).collect do |post|
        li link_to(post, admin_post_path(post))
      end
    end
  end
end

ActiveAdmin.register Post do

  action_item do
    post = Post.find_by_id(params[:id])
    link_to 'View on site', post.permalink if post
  end

  scope :all, default: true
  scope :draft do |resource|
    resource.where draft: true
  end
  scope :published do |resource|
    resource.where draft: false
  end

  filter :name
  filter :body
  filter :description
  filter :post_date

  index do
    column "Name", sortable: :name do |post|
      link_to post.name, [:admin, post]
    end
    column :draft
    column :post_date
  end

  show title: :name do
    attributes_table do
      row :id
      row :slug
      row :permalink
      row :name
      row :tag_list
      row :draft
      row :description
      row :body
    end
    active_admin_comments
  end
  form do |f|
    f.inputs "Content" do
      f.input :name
      f.input :description
      f.input :body
      f.input :thumbnail, as: :file, hint: (f.template.image_tag(f.object.thumbnail.url) if f.object.thumbnail?)
    end
    f.inputs "Meta information" do
      f.input :tag_list, label: 'Tags'
      f.input :post_date, as: :datepicker
      f.input :draft
    end
    f.buttons
  end

  controller do
    cache_sweeper :post_sweeper
  end
end

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
  filter :post_date

  index do
    column "Name", sortable: :name do |post|
      link_to post.name, [:admin, post]
    end
    column :image do |post|
      image_tag post.image.url(:small_thumb) if post.image.url
    end
    column :tag_list
    column :word_count
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
      row :commenting
      row :word_count
      row :image do
        image_tag resource.image if resource.image.url
      end
      row :body do
        markdown resource.body
      end
    end
    active_admin_comments
  end
  form do |f|
    f.inputs "Content" do
      f.input :name
      f.input :body
    end
    f.inputs "Meta information" do
      f.input :slug
      f.input :image, as: :file, hint: (f.template.image_tag(f.object.image.url) if f.object.image?)
      f.input :tag_list, label: 'Tags'
      f.input :post_date, as: :datepicker
      f.input :draft
      f.input :commenting, as: :select, collection: ['disqus', 'livefyre']
    end
    f.buttons
  end

  controller do
    cache_sweeper :post_sweeper
  end
end

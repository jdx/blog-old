ActiveAdmin.register Project do

  action_item do
    project = Project.find_by_id(params[:id])
    link_to 'View on site', project_path(project) if project
  end

  filter :name
  filter :body

  index do
    column "Name", sortable: :name do |project|
      link_to project.name, [:admin, project]
    end
  end

  show title: :name do
    attributes_table do
      row :id
      row :slug
      row :name
      row :url
      row :body do
        Redcarpet.new(resource.body).to_html.html_safe
      end
    end
    active_admin_comments
  end
  form do |f|
    f.inputs "Content" do
      f.input :name
      f.input :slug
      f.input :url
      f.input :body
    end
    f.buttons
  end
end

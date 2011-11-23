ActiveAdmin.register Post do
  action_item do
    if params[:id]
      link_to 'View on site', posts_path(params[:id])
    else
      link_to 'View on site', posts_path
    end
  end
end

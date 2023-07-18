ActiveAdmin.register Category do
  # actions :index, :edit, :update, :create, :destroy

  permit_params :id, :category_name

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :category_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Category" do
      f.input :category_name
    end
    f.actions
  end

  
end

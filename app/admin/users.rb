ActiveAdmin.register User do
  # actions :index, :edit, :update, :create, :destroy, :new

  permit_params :name, :email, :password
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :password
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs "User" do
      f.input :name
      f.input :email
      f.input :password
    end
    f.actions
  end
  
end

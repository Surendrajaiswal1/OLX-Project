ActiveAdmin.register SellProduct do
  actions :index, :edit, :update, :create, :destroy, :new

  # permit_params :name, :status, :price, :alphanumeric_id, :description

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :image, :status, :price, :alphanumeric_id, :description, :user_id, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :image, :status, :price, :alphanumeric_id, :description, :user_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

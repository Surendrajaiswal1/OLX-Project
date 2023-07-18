ActiveAdmin.register BuyProduct do

  # permit_params :id, :contact_number, :sell_product_id

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order_id, :contact_number, :user_id, :sell_product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:order_id, :contact_number, :user_id, :sell_product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "BuyProduct" do
      f.input :contact_number
      f.input :sell_product_id
      f.input :user_id
    end
    f.actions
  end
end

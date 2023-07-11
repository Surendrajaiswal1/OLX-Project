class SellProductsController < ApplicationController
  before_action :authenticate_request

  def create
    create_product=@current_user.sell_products.new(set_params)
    create_product.image.attach(params[:image])
    if create_product.save
      render json: create_product
    else
      render json: {error: create_product.errors}
    end
  end

  def show
    show_product=  @current_user.sell_products.find(params[:id])
    render json: show_product
    rescue ActiveRecord::RecordNotFound
    render json: {message: "ID not found"}
  end

  def show_all_products
    all_products =  @current_user.sell_products
    render json: all_products
  end

  def search 
    if (params[:name] || params[:alphanumeric_id])&&(!params[:name].blank? || !params[:alphanumeric_id].blank?)
      name=params[:name].strip if params[:name]
      alphanumeric_id=params[:alphanumeric_id].strip if params[:alphanumeric_id]

      search_products =  @current_user.sell_products.where("alphanumeric_id LIKE '%#{alphanumeric_id}%' and name LIKE '%#{name}%'")
      if search_products.empty?
        render json: {error: 'Record not found'}
      else
        render json: search_products
      end
    else
      render json: {message: "Please provide required field"}
    end
 end

  def update
    update_product = @current_user.sell_products.find(params[:id])
    if update_product.update(set_params)
      render json: update_product
    else
      render json: {message: "Updation failed"}
    end
    rescue ActiveRecord::RecordNotFound
    render json: {message: "ID not found"}
  end

  def destroy
    delete_product =   @current_user.sell_products.find(params[:id])
    if delete_product.delete
      render json: delete_product
    else
     render json: {message: "Could not destroy"}
    end
    rescue ActiveRecord::RecordNotFound
    render json: {message: "ID not found"}
  end

 private
   def set_params
    params.permit(:name, :image, :status, :price, :description, :category_id)
   end
end
   
class SellProductsController < ApplicationController
  before_action :authenticate_request
  before_action :get_id, only: [:show, :update, :destroy]

  def create
    create_product = @current_user.sell_products.new(set_params)
    return render json: create_product if create_product.save
    render json: {error: create_product.errors.full_messages}
  end

  def show
    render json: @product
  end

  def index
    all_products = @current_user.sell_products
    return render json: all_products unless all_products.empty?
      render json: {message: "NO PRODUCT AVAILABLE"}
  end

  def search_product 
    if (params[:name].present? || params[:alphanumeric_id]).present?
      
      name = params[:name].strip if params[:name]
      alphanumeric_id = params[:alphanumeric_id].strip if params[:alphanumeric_id]

      search_products =  @current_user.sell_products.where("alphanumeric_id LIKE '%#{alphanumeric_id}%' and name LIKE '%#{name}%'")
      if search_products.empty?
        render json: {error: 'Record not found'}
      else
        render json: search_products
      end
    else
      render json: {message: "PLEASE PROVIDE VALID NAME OR ALPHANUMERIC_ID FOR SEARCH"}
    end
 end

  def update
    return render json: @product if @product.update(set_params)
      render json: {message: "Updation failed"}
  end

  def destroy
    return render json: @product if @product.delete
     render json: {message: "PRODUCT DELETION FAILED"}
  end

 private
    def set_params
      params.permit(:name, :image, :status, :price, :description, :category_id)
    end

    def get_id
      @product = @current_user.sell_products.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      render json: {message: "ID not found"}
    end
end
   
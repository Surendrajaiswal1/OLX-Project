class SellProductsController < ApiController
  before_action :authenticate_request
  before_action :get_product, only: [:show, :update, :destroy]

  def create
    create_product = @current_user.sell_products.new(set_params)
    return render json: create_product if create_product.save
    render json: { error: create_product.errors.full_messages }
  end

  def show
    render json: @product
  end

  def index
     if params[:name].present?
      name = params[:name].strip
      products = @current_user.sell_products.where("name LIKE '%#{name}%'")
      render json: products
    elsif params[:alphanumeric_id].present?          
      alphanumeric_id = params[:alphanumeric_id].strip
      products = @current_user.sell_products.where("alphanumeric_id LIKE '%#{alphanumeric_id}%'")
      render json: products
    else
      all_products = @current_user.sell_products.page(params[:page])
      return render json: all_products unless all_products.empty?
      render json: {message: "NO PRODUCT AVAILABLE"}
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
      params.permit(:name, :price, :description, :category_id, :image)
    end

    def get_product
      @product = @current_user.sell_products.find_by(id: params[:id])
      render json: {message: "PRODUCT NOT FOUND"} unless @product.present?
    end
end
   
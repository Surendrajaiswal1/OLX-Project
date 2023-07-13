class BuyProductsController < ApplicationController
  before_action :authenticate_request

  def show_available_product
    products = SellProduct.available
    return render json: products unless products.nil? 
    render json: {message: "NO PRODUCT AVAILABLE"}
  end

  def show_data_category_wise
    show_products =  Category.all
    render json: show_products
  end

  def create
    buy_product = @current_user.buy_products.new(set_params)
    product_data = SellProduct.find_by(id: params[:sell_product_id])
    return render json: {message: "Product is OUT OF STOCK"} if product_data.status == 'sold' || @current_user.id == product_data.user_id
    buy_product.save
    render json: buy_product
  end

  def index
    purchase_product = @current_user.buy_products
    return render json: purchase_product unless purchase_product.nil?
    render json: {message: "ORDER HISTORY IS EMPTY"}
  end

  def search_in_history
    search = @current_user.buy_products.find_by(id: params[:id])
    return render json: search if search
    render json: {message: "NO SUCH ORDER FOUND"}
  end

  def search_by_category_and_name
    if params[:name].present?  || params[:category_name].present?

      name = params[:name].strip if params[:name]
      category_name = params[:category_name].strip if params[:category_name]

      search_products = SellProduct.joins(:category).where("category_name like '%#{category_name}%'and name like '%#{name}%'")

      if search_products.empty?
        render json: {error: 'Record not found'}
      else
        render json: search_products  
      end
    else
      render json: {message: "FOR SEARCH THE PRODUCT ENTER NAME OR CATEGORY"}
    end
  end

  def update_status(product_id)
    change_status = SellProduct.find(product_id)
    change_status = change_status.update(status: 'sold')
  end

  private

  def set_params
    params.permit(:contact_number, :sell_product_id)
  end
end

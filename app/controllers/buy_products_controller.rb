class BuyProductsController < ApplicationController
  before_action :authenticate_request

  def show_available_product
    product= SellProduct.all
    if product
      render json: product
    else
      render json: {message: "NO PRODUCT AVAILABLE"}
    end
  end
   
  def show_data_category_wise
    show_all = ActiveRecord::Base.connection.execute("select all_category, name,alphanumeric_id,price from categories inner join sell_products on sell_products.category_id = categories.id")
    render json: show_all
  end
   
  def purchase_product
    buy= @current_user.buy_products.new(set_params)
    data=SellProduct.find_by(id: params[:sell_product_id])
    data= data.status
    if buy.save && data=="available"
      buy_data = buy.sell_product_id
      update_status(buy_data)
      render json: buy
    else
     render json: {message: "Product is no more available"}
    end
 end
   
  def index
    purchase_data= @current_user.buy_products.all
    unless purchase_data.nil?
      render json: purchase_data
    else
     render json: {message: "No purchase product"}
   end
 end

  def search_in_history
    search=@current_user.buy_products.find_by(id: params[:id])
    if search
      history= []
      buy_data = search.sell_product_id
      buy_data = SellProduct.find_by(id: buy_data)
      h = Hash.new 
      h[:name] = buy_data.name
      h[:image] = buy_data.image.url
      h[:price] = buy_data.price
      @name = Category.find_by(id: buy_data.category_id)
      h[:category_id]=  buy_data.category_id
      h[:category_name]=@name.all_category
      history.push(h)
      render json: history
    else
     render json: {message: "No purchase product from thid id"}
   end
 end
   
  def search_by_category_and_name
    if (params[:name] || params[:all_category])&&(!params[:name].blank? || !params[:all_category].blank?)
      name=params[:name].strip if params[:name]
      all_category=params[:all_category].strip if params[:all_category]

      search_products =  ActiveRecord::Base.connection.execute("Select category_id,all_category,sell_products.id,name,price,status,description from categories inner join sell_products on sell_products.category_id=categories.id where sell_products.category_id=categories.id and all_category like '%#{all_category}%'and name like '%#{name}%'")
      if search_products.empty?
        render json: {error: 'Record not found'}
      else
        render json: search_products
      end
    else
      render json: {message: "Please provide required field"}
    end
  end
   
  def update_status(data)
    change=SellProduct.find(data)
    change=change.update(status: "sold")
  end

  private
    def set_params
      params.permit(:order_id, :contact_number, :sell_product_id)
     end
end
   
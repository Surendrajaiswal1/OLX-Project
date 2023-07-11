class CategoriesController < ApplicationController
  def index
    category= Category.all
    if category
      render json: category
    else
      render json: {message: "No category found"}
    end
  end

  def create
    category=Category.new(set_params)
    if category.save
      render json: category
    else
      render json: {error: "No category created"}
    end
  end

  def update
    category=Category.find(params[:id])
    if category.update(set_params)
      render json: category
    else
      render json: {message: "Updation failed"}
    end
  end

  def destroy
    category=Category.find(params[:id])
    if category.destroy
      render json: category
    else
      renser json: {message: "Could not destroy"}
    end
  end

  private
    def set_params
      params.permit(:all_category)
    end
end

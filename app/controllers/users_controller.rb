class UsersController < ApplicationController
  before_action :authenticate_request,only: [:update_user,:destroy_user]

  def create
    sign_up = User.new(set_params)
    if sign_up.save
    render json: sign_up 
    else
      render json: {data: sign_up.errors.full_messages}
    end
  end

  def login
    if params[:email] && params[:password]
    user_login= User.find_by(email: params[:email],password: params[:password])
     if user_login
      token = jwt_encode(user_id: user_login.id)
      render json: {token: token}, status: :ok
    else
      render json: {error: "Unauthorized"}, status: :unauthorized
    end
    else
      render json: {error: "Field Cant Found"}, status: :unauthorized
    end
  end

  def index
    users=User.all
    if users
      render json: users
    else
      render json: {message: 'No users'}
    end
  end

  def show
    show_user= User.find(params[:id])
    if show_user
      render json: show_user
    else
      render json: {message: 'No particular users'}
    end
    rescue ActiveRecord::RecordNotFound
    render json: {message: "ID not found"}
  end

  def destroy_user
    destroy_user= User.find_by(id:  @current_user.id)
    if destroy_user.destroy
      render json: destroy_user
    else
      render json: {message: 'No particular users'}
    end
    rescue ActiveRecord::RecordNotFound
    render json: {message: "ID not found"}
  end

  def update_user
    @update_user= User.find_by(id:  @current_user.id)
    if @update_user.update(set_params)
      render json: @update_user
    else
      render json: {data: @update_user.errors.full_messages,error: 'Updation Failed'}
    end
    rescue ActiveRecord::RecordNotFound
    render json: {message: "ID not found"}
  end

  private
    def set_params
       params.permit(:name, :email, :password)
    end
end
  
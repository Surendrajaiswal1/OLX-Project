class UsersController < ApplicationController
  before_action :authenticate_request, only: [:update, :destroy]

  def create
    sign_up = User.new(set_params)
    return render json: {message: 'YOU HAVE SUCCESSFULLY REGISTERED'} if sign_up.save
      render json: {data: sign_up.errors.full_messages}
  end

  def login
    user_login = User.find_by(email: params[:email],password: params[:password])
    if user_login
      token = jwt_encode(user_id: user_login.id)
      render json: {message: 'YOU HAVE SUCCESSFULLY LOGED IN', token: token}, status: :ok
    else
      render json: {error: 'EMAIL AND PASSWORD SHOULD BE VALID'}, status: :unauthorized
    end
  end

  def show_all_users
    users = User.all
    return render json: users unless users.empty?
      render json: {message: 'NO USERS AVAILABLE '}
  end

  def show
    show_user = User.find(params[:id])
    return render json: show_user if show_user
      render json: {message: 'NO PARTICULAR USER FOUND'}
    rescue ActiveRecord::RecordNotFound
    render json: {message: 'ID not found'}
  end

  def destroy
    destroy_user = @current_user
    return render json: {message: 'ACCOUNT DELETED', data: destroy_user} if destroy_user.destroy
      render json: {message: 'NO PARTICULAR USER FOUND'}
  end

  def update
    @update_user = @current_user
    return render json: {message: 'YOU HAVE SUCCESSFULLY UPDATED YOUR ACCOUNT', data: @update_user} if @update_user.update(set_params)
      render json: {data: @update_user.errors.full_messages, error: 'Updation Failed'}
  end

  private
  def set_params
    params.permit(:name, :email, :password)
  end
end
  
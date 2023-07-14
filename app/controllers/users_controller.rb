class UsersController < ApiController
  before_action :authenticate_request, only: [:update, :destroy]
  before_action :get_user, only: [:show, :update, :destroy]

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

  def index
    users = User.all
    return render json: users unless users.empty?
      render json: {message: 'NO USERS AVAILABLE '}
  end

  def show
    return render json: @user
  end

  def destroy
    if @current_user.id == @user.id
      return render json: {message: 'ACCOUNT DELETED', data: @user} if @user.destroy
        render json: {message: 'NO PARTICULAR USER FOUND'}
    else
      render json: {message: "PLEASE ENTER VALID ID"}
    end
  end

  def update    
    if @current_user.id == @user.id
      return render json: {message: 'YOU HAVE SUCCESSFULLY UPDATED YOUR ACCOUNT', data: @user} if @user.update(set_params)
      render json: {data: update_user.errors.full_messages, error: 'Updation Failed'}
    else 
      render json: {message: "PLEASE ENTER VALID ID"}
    end
  end

  private
  def set_params
    params.permit(:name, :email, :password)
  end

  def get_user
    @user = User.find_by(id: params[:id])
    render json: {message: "ID not found"} unless @user.present?
  end
end
  
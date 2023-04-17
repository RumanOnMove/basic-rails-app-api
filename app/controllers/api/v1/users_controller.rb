class Api::V1::UsersController < ProtectedController
  # List of user
  def index
    users = User.all
    render json: {users: users}, status: :ok
  end

  # Show user
  def show
    user = User.find_by(id: params[:id])
    if user.present?
      render json: {user: user}, status: :ok
    else
      render json: {error: "Invalid user id"}, status: :not_found
    end
  end

  # Create new user
  def create
    user = User.new(user_params)
    if user.save
      render json: {user: user}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # Update user
  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: {user: user}, status: :ok
    else
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # Delete user
  def destroy
    user = User.find_by(id: params[:id])
    if user&.destroy
      render json: {message: 'User deleted successfully'}, status: :ok
    else
      render json: {error: 'Not found'}, status: :unprocessable_entity
    end
  end

  private
  # Customize user params
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

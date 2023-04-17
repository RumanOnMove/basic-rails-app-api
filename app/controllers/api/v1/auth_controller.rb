class Api::V1::AuthController < ApplicationController
  # Login
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encode_token({user_id: user.id})
      render json: {token: token}, status: :ok
    else
      render json: {error: 'Invalid email or password!'}, status: :unauthorized
    end
  end

  # Registration
  def registration
    puts params.inspect
    user = User.new(user_params)
    if user.save
      render json: {data: user}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  # Generate Token
  def encode_token(payload)
    JWT.encode(payload, 'MY_APP_TOKEN') # key shouldn't be hard coded
  end

  # Customize user params
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

class ProtectedController < ApplicationController
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JWT.decode(header, 'MY_APP_TOKEN', true, algorithm: 'HS256')
      @current_user_id = decoded[0]['user_id']
    rescue JWT::DecodeError
      render json: {error: 'Invalid token'}, status: :unauthorized
    end
  end
end

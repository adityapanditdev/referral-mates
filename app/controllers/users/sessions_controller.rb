# frozen_string_literal: true

module Users
  # app/controllers/users/registration_contoller.rb
  class SessionsController < Devise::SessionsController
    before_action :authorize_request, except: :create
    protect_from_forgery with: :null_session

    def create
      user = User.find_by_email(params[:user][:email])
      if user&.valid_password?(params[:user][:password])
        render json: {
          id: user.id,
          token: token(user.id),
          email: user.email
        }, status: :ok
      else
        render json: { error: 'Invalid Credentials' }, status: :unauthorized
      end
    end

    private

    def token(user_id)
      JsonWebToken.encode(user_id: user_id)
    end
  end
end

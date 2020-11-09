module Api
  class UsersController < ApplicationController

    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate, except: [:login]
    before_filter :set_current_user

    def login
      email = params[:email]
      password = params[:password]
      render json: {status: false, message: "Email/Password not sent", data: {}}, status: 400 and return if email.blank? || password.blank?
      user = ::User.find_by_email(email)
      render json: {status: false, message: "Invalid Email", data: {}}, status: 422 and return if user.blank?
      render json: {status: false, message: "You are not allowed to access this tool", data: {}}, status: 403 and return if user.date_of_leaving.present?
      if user.valid_password?(password)
        token = user.tokens.build(:token=> ::Users::Token.generate_unique_token)
        if token.save
          render json: {status: true, message: "Success", data: {token: token.token, id: user.id, name: user.name, email: user.email, role: (user.role_name)}, status: 200 and return
        else
          render json: {status: false, message: "#{token.errors.full_messages.join(', ')}", data: {}}, status: 422 and return
        end
      else
        render json: {status: false, message: "Password Invalid", data: {}}, status: 422 and return
      end
    end

    protected

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        user_token = ::Users::Token.find_by(token: token)
        @current_app_user = user_token.user if user_token.present?
        return @current_app_user.present?
      end
    end

    def render_unauthorized
      render json: {status: false, message: 'Invalid Authentication'}, status: 401
    end

    def set_current_user
      User.current_user = @current_app_user
    end

  end
end
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  def set_remember_token
    token = SecureRandom.urlsafe_base64
    Digest::SHA1.hexdigest token
  end

  def sign_in
    @current_user.update(remember_token: set_remember_token)
    cookies.permanent[:remember_token] = @current_user.remember_token
  end

  def set_current_user
    @current_user = User.find_by(email: params[:session][:email])
  end

  def sign_out
    @current_user = nil
    cookies.delete :remember_token
  end
end

# frozen_string_literal: true

module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
  end

  def sign_in
    @current_user.update(remember_token: set_remember_token)
    cookies.permanent[:remember_token] = @current_user.remember_token
  end

  def set_remember_token
    token = SecureRandom.urlsafe_base64
    Digest::SHA1.hexdigest token
  end
end

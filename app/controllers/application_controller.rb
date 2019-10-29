# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  def sign_in
    @current_user.update(remember_token: set_remember_token)
    cookies.permanent[:remember_token] = @current_user.remember_token
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
  end

  def set_current_user
    @current_user = User.find_by(email: params[:session][:email])
  end
end

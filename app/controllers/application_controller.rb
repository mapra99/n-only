# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  def set_current_user
    @current_user = User.find_by(email: params[:session][:email])
  end

  def sign_out
    @current_user = nil
    cookies.delete :remember_token
  end
end

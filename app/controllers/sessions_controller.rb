# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    set_current_user
    if @current_user&.authenticate(params[:session][:password])
      sign_in
      render html:"yes!"
    else
      render :new
    end
  end
end

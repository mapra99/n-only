# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    set_current_user
    if @current_user&.authenticate(params[:session][:password])
      sign_in
      render html:"Signed in"
    else
      render :new
    end
  end

  def delete
    sign_out
    redirect_to signin_path
  end
end

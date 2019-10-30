# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    set_current_user
    if @current_user&.authenticate(params[:session][:password])
      sign_in
      redirect_to root_path
    else
      render html: "Credentials provided are wrong"
    end
  end

  def delete
    sign_out
    redirect_to root_path
  end
end

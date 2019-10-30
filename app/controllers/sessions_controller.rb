# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :non_users_restricted_access, only: %i[new create]

  def new; end

  def create
    set_current_user
    if @current_user&.authenticate(params[:session][:password])
      sign_in
      redirect_to root_path
    else
      render html: 'Credentials provided are wrong'
    end
  end

  def delete
    sign_out
    redirect_to root_path
  end

  private

  def non_users_restricted_access
    redirect_to root_path if current_user
  end
end

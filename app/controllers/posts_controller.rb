class PostsController < ApplicationController
  include ApplicationHelper

  before_action :users_restricted_access, only: [:new, :create]

  def new
  end

  def create
  end

  def index
  end

  private

  def users_restricted_access
    redirect_to signin_path unless current_user
  end
end

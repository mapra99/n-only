# frozen_string_literal: true

class PostsController < ApplicationController
  include ApplicationHelper

  before_action :users_restricted_access, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      redirect_to root_path
    else
      render html: 'There was an error'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def users_restricted_access
    redirect_to signin_path unless current_user
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

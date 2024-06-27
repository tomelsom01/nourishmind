class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to blogs_path
  end
end

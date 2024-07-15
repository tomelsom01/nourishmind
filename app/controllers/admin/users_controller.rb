class Admin::UsersController < ApplicationController
  before_action :set_yoga_class
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = @yoga_class.users
  end

  def new
    @users = @yoga_class.users.build
  end

  def create
    @user = @yoga_class.users.build(user_params)
    if @user.save
      redirect_to admin_yoga_class_users_path(@yoga_class), notice: `#{current_user.name} was successfully added.`
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_yoga_class_users_path(@yoga_class), notice: 'Participant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_yoga_class_users_path(@yoga_class), notice: 'Participant was successfully deleted.'
  end

  private

  def set_yoga_class
    @yoga_class = YogaClass.find(params[:yoga_class_id])
  end

  def set_user
    @user = @yoga_class.users.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end

class YogaClassesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_yoga_class, only: [:show, :edit, :update, :destroy]

  def index
    @yoga_classes = YogaClass.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @yoga_class = YogaClass.new
  end

  def create
    @yoga_class = YogaClass.new(yoga_class_params)
    if @yoga_class.save
      redirect_to @yoga_class, notice: 'Yoga class was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @yoga_class.update(yoga_class_params)
      redirect_to @yoga_class, notice: 'Yoga class was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @yoga_class.destroy
    redirect_to yoga_classes_url, notice: 'Yoga class was successfully destroyed.'
  end

  private

  def set_yoga_class
    @yoga_class = YogaClass.find(params[:id])
  end

  def yoga_class_params
    params.require(:yoga_class).permit(:title, :description, :start_time, :end_time)
  end

  def authenticate_admin!
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user&.admin?
  end
end

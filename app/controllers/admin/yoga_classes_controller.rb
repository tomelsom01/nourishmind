class Admin::YogaClassesController < ApplicationController

  before_action :set_yoga_class, only: [:show, :edit, :update, :destroy]

  def index
    @yoga_classes = YogaClass.all
  end

  def show
  end

  def new
    @yoga_class = YogaClass.new
  end

  def edit
  end

  def create
    @yoga_class = YogaClass.new(yoga_class_params)
    if @yoga_class.save
      redirect_to admin_yoga_classes_path, notice: 'Yoga class was successfully created.'
    else
      render :new
    end
  end

  def update
    if @yoga_class.update(yoga_class_params)
      redirect_to admin_yoga_classes_path, notice: 'Yoga class was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @yoga_class.destroy
    redirect_to admin_yoga_classes_path, notice: 'Yoga class was successfully deleted.'
  end

  private

  def set_yoga_class
    @yoga_class = YogaClass.find(params[:id])
  end

  def yoga_class_params
    params.require(:yoga_class).permit(:name, :description, :date, :location)
  end
end

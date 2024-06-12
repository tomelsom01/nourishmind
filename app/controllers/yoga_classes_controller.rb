class YogaClassesController < ApplicationController
  def index
    @yoga_classes = YogaClass.all
  end

  def show
    @yoga_class = YogaClass.find(params[:id])
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

  private

  def yoga_class_params
    params.require(:yoga_class).permit(:title, :description, :start_time, :end_time)
  end
end

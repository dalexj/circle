class InnerCirclesController < ApplicationController
  def new
    @inner_circle = InnerCircle.new
  end

  def create
    @inner_circle = InnerCircle.new(circle_params)
    @inner_circle.user = current_user
    if @inner_circle.save
      redirect_to inner_circle_path(@inner_circle)
    else
      flash[:error] = 'Could not create Inner Circle. Try again.'
      render :back
    end
  end

  def show
    @inner_circle = InnerCircle.find(params[:id])
  end

  private

  def circle_params
    params.require(:inner_circle).permit(:name)
  end
end

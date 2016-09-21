class CarriagesController < ApplicationController
before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def new
    @carriage = Carriage.new
  end

  def create
    carriage_type = params[:carriage][:type].constantize
    @carriage = carriage_type.new(carriage_params)
    respond_to do |format|
      if @carriage.save
        format.html { redirect_to carriages_path, notice: 'Вагон успешно создан'}
      else
        format.html {render :edit }
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @carriage.update(carriage_params)
        format.html { redirect_to carriages_path, notice: 'Вагон успешно отредактирован'}
      else
        format.html {render :edit }
      end
    end
  end

  def destroy
    @carriage.destroy
    respond_to do |format|
      format.html { redirect_to carriages_url, notice: 'Вагон успешно удален'}
    end
  end

private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:type, :train_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats)
  end

end

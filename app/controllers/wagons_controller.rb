class WagonsController < ApplicationController
before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def new
    @wagon = Wagon.new
  end

  def create
    @wagon = Wagon.new(wagon_params)
    respond_to do |format|
      if @wagon.save
        format.html { redirect_to @wagon, notice: 'Вагон успешно создан'}
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
      if @wagon.update(wagon_params)
        format.html { redirect_to @wagon, notice: 'Вагон успешно отредактирован'}
      else
        format.html {render :edit }
      end
    end
  end

  def destroy
    @wagon.destroy
    respond_to do |format|
      format.html { redirect_to wagons_url, notice: 'Вагон успешно удален'}
    end
  end

private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:w_type, :upper_seats, :lower_seats, :train_id)
  end

end

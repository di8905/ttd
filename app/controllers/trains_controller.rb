class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
    @coup_wagons_count = 0
    @platz_upper_seats_count = 0
    @platz_lower_seats_count = 0
    @coup_upper_seats_count = 0
    @coup_lower_seats_count = 0
    @train.wagons.each do |wagon|
      if wagon.w_type == 'Плацкарт'
        @platz_wagons_count += 1
        @platz_upper_seats_count += wagon.upper_seats
        @platz_lower_seats_count += wagon.lower_seats
      else
       @coup_wagons_count += 1
       @coup_upper_seats_count += wagon.upper_seats
       @coup_lower_seats_count += wagon.lower_seats
      end
    end
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to @train, notice: 'Поезд успешно создан.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Поезд успешно отредактирован.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Поезд удален.' }
    end
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id)
    end
end

class Admin::RailwayStationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :set_departure, :set_arrival]
  before_action :set_route, only: [:update_position, :set_departure, :set_arrival]
  before_action :get_time_value, only: [:set_departure, :set_arrival]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to [:admin, :railway_stations], notice: 'Станция успешно создана.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to [:admin, @railway_station], notice: 'Станция успешно отредактирована.' }
      else
        format.html { render :edit }
      end
    end
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to [:admin, @route]
  end

  def set_departure
    @railway_station.set_departure(@route, @time)
    redirect_to [:admin, @route]
  end

  def set_arrival
    @railway_station.set_arrival(@route, @time)
    redirect_to [:admin, @route]
  end

  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to admin_railway_stations_url, notice: 'Станция удалена.' }
    end
  end

  private

  def get_time_value
    @time = "#{params[:date][:hour]}:#{params[:date][:minute]}"
  end

  def set_route
    @route = Route.find(params[:route_id])
  end

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end

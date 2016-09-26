class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:index, :create, :new]

  def index
    @carriages = Carriage.all
  end

  def new
    @carriage = Carriage.new
  end

  def create
    if Carriage::ALLOWED_TYPES.include?(params[:carriage][:type])
      carriage_type = params[:carriage][:type].constantize
      @carriage = carriage_type.new(carriage_params)
      respond_to do |format|
        if @carriage.save
          format.html { redirect_to @carriage.train, notice: 'Вагон успешно создан' }
        else
          format.html { render :edit }
        end
      end
    else
      redirect_to carriages_path, notice: 'Неверный тип вагона, вагон не создан'
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @carriage.update(carriage_params)
        format.html { redirect_to @carriage.train, notice: 'Вагон успешно отредактирован' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @carriage.destroy
    respond_to do |format|
      format.html { redirect_to @carriage.train, notice: 'Вагон успешно удален' }
    end
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end
  
  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:type, :train_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats)
  end
end

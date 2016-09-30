class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :destroy, :edit]
  before_action :set_related_params, only: [:new, :create]
  before_action :set_user, only: [:create, :update]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @user.tickets.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_path(@ticket), notice: "Билет куплен" }
      else
        format.html { render 'new' }
      end
    end
  end

  def edit
    @train = @ticket.train
    @departure_station = @ticket.departure_station
    @destination_station = @ticket.destination_station
  end

  def show
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to admin_tickets_path, notice: 'Билет удален' }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_related_params
    @train = Train.find(params[:ticket][:train_id])
    @departure_station = RailwayStation.find(params[:ticket][:departure_station_id])
    @destination_station = RailwayStation.find(params[:ticket][:destination_station_id])
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :train_id, :credentials, :passport_number, :departure_station_id, :destination_station_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

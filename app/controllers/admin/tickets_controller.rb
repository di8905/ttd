class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :destroy, :edit, :update]
  
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end
  
  def show
  end

  def create
    @user = User.find(ticket_params[:user_id])
    @ticket = @user.tickets.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to admin_ticket_path(@ticket), notice: "Билет создан" }
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

  def update
    @ticket.update(ticket_params)
    if @ticket.save
      redirect_to admin_ticket_path(@ticket), notice: "Билет отредактирован"
    else
      render 'new'
    end
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

  def ticket_params
    params.require(:ticket).permit(:user_id, :train_id, :credentials, :passport_number, :departure_station_id, :destination_station_id)
  end
  
end

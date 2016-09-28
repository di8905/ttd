class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy]
  
  def index
    @tickets = Ticket.all
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_path(@ticket), notice: "Билет куплен" }
      else
        set_related_params
        format.html { render 'new' }
      end
    end
  end
  
  def show
  end
  
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Билет удален' }
    end
  end
  
  private 
  
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
  
  def set_related_params
    @train = params[:ticket][:train_id]
    @departure_station = params[:ticket][:departure_station]
    @destination_station = params[:ticket][:destination_station]
  end
  
  def ticket_params
    params.require(:ticket).permit(:user_id, :train_id, :credentials, :passport_number, :departure_station_id, :destination_station_id)
  end
  
end

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end
  
  def new
    @ticket = Ticket.new
    @train = Train.find(params[:train_id])
  end
  
  def create
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_search_path, notice: "Билет куплен" }
      else
        format.html {render :edit}
      end
    end
  end
  
  private 
  
  def ticket_params
    params.require(:ticket).permit(:user, :train_id, :credentials, :passport_number)
  end
  
end

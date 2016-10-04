class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :departure_station, class_name: 'RailwayStation', foreign_key: :departure_station_id
  belongs_to :destination_station, class_name: 'RailwayStation', foreign_key: :destination_station_id

  validates :user_id, :train_id, :departure_station_id, :destination_station_id, :credentials, :passport_number, presence: true
  
  after_create -> { send_notification(:buy_ticket) }
  before_destroy -> { send_notification(:cancel_ticket) }
  
  def route_name
    "#{departure_station.title} - #{destination_station.title}" 
  end
  
  private 
  
  def send_notification(action)
    TicketsMailer.try(action, self.user, self).deliver_now
  end
  
  
  
end

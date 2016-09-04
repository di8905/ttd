class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :departure_station, class_name: 'RailwayStation', foreign_key: :departure_station_id
  belongs_to :destination_station, class_name: 'RailwayStation', foreign_key: :destination_station_id
end

class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
end

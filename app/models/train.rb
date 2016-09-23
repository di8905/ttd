class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def seats_count(carriage_type, seat_type)
    self.carriages.where(type: carriage_type).sum(seat_type)
  end

end

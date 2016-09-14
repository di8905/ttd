class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagon_count(wagon_type)
    count = 0
    self.wagons.each do |wagon|
      count += 1 if wagon.w_type == wagon_type
    end
    count
  end

  def seats_count(wagon_type, seat_type)
    count = 0
    self.wagons.each do |wagon|
      count += wagon.send(seat_type.to_s) if wagon.w_type == wagon_type 
    end
    count
  end

end

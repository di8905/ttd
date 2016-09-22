class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true



  # def carriage_count(carriage_type)
  #   count = 0
  #   self.carriages.each do |carriage|
  #     count += 1 if carriage.w_type == carriage_type
  #   end
  #   count
  # end
  #
  def seats_count(carriage_type, seat_type)
    self.carriages.where(type: carriage_type).pluck(seat_type.to_sym).inject(:+)
  end

end

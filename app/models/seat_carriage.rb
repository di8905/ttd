class SeatCarriage < Carriage

  validates :seats, presence: true

  def type_name
    "Сидячий"
  end
end

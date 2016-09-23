class CoupeCarriage < Carriage
  validates :top_seats, :bottom_seats, presence: true

  def type_name
    'Купе'
  end
end

class Carriage < ApplicationRecord
  ALLOWED_TYPES = %w(SvCarriage CoupeCarriage EconomyCarriage SeatCarriage).freeze

  belongs_to :train

  before_create :set_number

  validates :number, uniqueness: true

  scope :ordered, -> (ascending) { ascending ? order(:number) : order('number DESC') }

  def type_name
    'Не указан'
  end

  protected

  def set_number
    last_num = Carriage.maximum('number') || 0
    self.number = last_num + 1
  end
end

class Carriage < ApplicationRecord
  belongs_to :train

  before_create :set_number

  validates :number, uniqueness: true

  scope :ordered, -> (ascending) { ascending ? order(:number) : order("number DESC") }

  def set_number
    last_num = Carriage.pluck(:number).max || 0
    self.number = last_num + 1
  end

  def type_name
    'Не указан'
  end

end

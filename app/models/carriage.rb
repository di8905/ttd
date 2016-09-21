class Carriage < ApplicationRecord
  belongs_to :train

  def type_name
    'Не указан'
  end

end

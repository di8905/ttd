class Wagon < ApplicationRecord
  belongs_to :train

  validates :w_type, presence: true
end

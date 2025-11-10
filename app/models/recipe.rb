class Recipe < ApplicationRecord
  VALID_KINDS=%w[primo secondo contorno dolce altro]
  validates :kind, inclusion: { in: VALID_KINDS }
  has_one_attached :featured_image
  has_rich_text :description

  validates :name, presence: true

end

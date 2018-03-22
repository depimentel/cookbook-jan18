class Cuisine < ApplicationRecord
  has_many :recipes

  #validates_presence_of :nome, message: "deve ser preenchido"
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
end

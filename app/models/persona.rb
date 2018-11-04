class Persona < ApplicationRecord
  has_many :peleas

  validates :name, presence: true
  validates :email, presence: true
end

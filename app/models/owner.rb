class Owner < ApplicationRecord
  validates_presence_of :name

  has_many :snacks
  has_many :machines
end

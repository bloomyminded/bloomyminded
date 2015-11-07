class Cheese < ActiveRecord::Base
  validates :name, presence: true
  validates :producer, presence: true
  validates :region, presence: true
  validates :country, presence: true
  validates :milk, presence: true
  validates :rind, presence: true
  validates :texture, presence: true
  validates :rennet, presence: true
  validates :age, presence: true
  validates :description, presence: true
end

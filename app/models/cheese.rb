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

  has_attached_file :cheeseimg, styles: { medium: "300x300>", thumb: "100x100>"  }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cheeseimg, content_type: /\Aimage\/.*\Z/

  acts_as_taggable

  scope :similar_cheeses, -> () { find_related_tags }
  scope :has_tag, -> (tag) { Cheese.tagged_with(tag) }
end

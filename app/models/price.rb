class Price < ApplicationRecord
  acts_as_api
  has_paper_trail

  # Relations
  belongs_to :product

  # Attributes
  validates :product_id, :date, presence: true
  validates :price, presence: true, numericality: true

  api_accessible :base do |template|
    template.add :date
    template.add :price
  end

  # Class Methods
  class << self
    def till_date(date)
      where("date <= :date", date: date)
    end
  end
end

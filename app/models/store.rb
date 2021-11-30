class Store < ApplicationRecord
  EMAIL_FORMAT = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  acts_as_api

  # Relations
  has_many :orders, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, format: {
    with: EMAIL_FORMAT,
  }, uniqueness: {
    case_sensitive: false,
  }
  validates :phone, presence: true

  # API Templates
  api_accessible :base do |template|
    %i[id name address email phone].each do |field|
      template.add field
    end
  end
end

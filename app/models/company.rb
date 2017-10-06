class Company < ApplicationRecord
  has_many :invoices, inverse_of: :company, dependent: :destroy

  validates :name, :address, :contact, :gstno, presence: true, length: {minimum: 5}
  validates :state, :code, presence: true, length: {minimum: 2}
end

class Client < ApplicationRecord
  has_many :invoices, inverse_of: :client, dependent: :destroy
  validates :name, :address, presence: true, length: {minimum: 5}
  validates :code, presence: true, length: {minimum: 2}
end

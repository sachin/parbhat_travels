class InvoiceItem < ApplicationRecord
  belongs_to :invoice, inverse_of: :invoice_items

  validates :quantity, :rate, :invoice, :amount, presence: true
  validates :rate, :amount, numericality: {greater_than: 0}

  before_validation :generate_amount

  def display_gst_rate
    gst_rate.to_f / (invoice.is_interstate? ? 1 : 2)
  end

  def gst_tax
    (amount * display_gst_rate)/100.0
  end

  def total_amount
    amount + gst_tax * (invoice.is_interstate? ? 1 : 2 )
  end

  private

  def generate_amount
    self.amount = quantity * rate - discount.to_i;
  end
end

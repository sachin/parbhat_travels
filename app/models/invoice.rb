class Invoice < ApplicationRecord
  belongs_to :company, inverse_of: :invoices
  belongs_to :client, inverse_of: :invoices
  has_many :invoice_items, inverse_of: :invoice, dependent: :destroy

  accepts_nested_attributes_for :invoice_items, reject_if: :all_blank, allow_destroy: true

  validates :invoice_no, presence: true, numericality: true, uniqueness: {scope: [:company, :client]}
  validates :invoice_date, :date_of_supply, :company, :client, presence: true

  before_validation :populate_invoice_number, on: :create
  before_validation :populate_invoice_date, on: :create


  def total_amount
    invoice_items.collect{|inv| inv.amount}.sum
  end

  def total_tax
    invoice_items.collect{|inv| inv.gst_tax}.sum
  end

  def total_amount_with_tax
    total_amount + total_tax*(is_interstate? ? 1 : 2)
  end

  def delete
    raise TryToDeleteNonDeletableEntity
  end

  def destroy
    raise TryToDeleteNonDeletableEntity
  end

  def is_interstate?
    company.code != client.code
  end

  private

  def populate_invoice_number
    self.invoice_no = (self.company.invoices.order('invoice_no desc').take.invoice_no rescue 0) + 1
  end

  def populate_invoice_date
    return unless invoice_date.nil?
    self.invoice_date = Date.today()
  end


end

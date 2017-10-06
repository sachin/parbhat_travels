class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :company, foreign_key: true
      t.references :client, foreign_key: true
      t.integer :invoice_no
      t.date :invoice_date
      t.string :reverse_charge, default: 'N'
      t.string :transport_mode, default: 'N\A'
      t.string :vehicle_no, default: 'N\A'
      t.string :date_of_supply
      t.string :place_for_supply

      t.timestamps
    end
  end
end

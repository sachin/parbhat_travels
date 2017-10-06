class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, foreign_key: true
      t.string :description
      t.string :hsn_code
      t.string :udm
      t.integer :quantity
      t.integer :rate
      t.integer :amount
      t.integer :discount
      t.integer :gst_rate, default: 5
      t.timestamps
    end
  end
end

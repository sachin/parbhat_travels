json.extract! invoice_item, :id, :invoice_id, :description, :hsn_code, :udm, :quantity, :rate, :amount, :discount, :created_at, :updated_at
json.url invoice_item_url(invoice_item, format: :json)

json.extract! invoice, :id, :company_id, :client_id, :invoice_no, :invoice_date, :reverse_charge, :transport_mode, :vehicle_no, :date_of_supply, :place_for_supply, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)

json.extract! client, :id, :company_id, :name, :address, :gstno, :state, :code, :ship_name, :ship_address, :ship_gstno, :ship_state, :ship_code, :created_at, :updated_at
json.url client_url(client, format: :json)

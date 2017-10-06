json.extract! company, :id, :name, :address, :contact, :gstno, :created_at, :updated_at
json.url company_url(company, format: :json)

json.extract! contact, :id, :name, :email, :telephone, :cell_phone, :contact_type, :excluded, :created_at, :updated_at
json.url contact_url(contact, format: :json)

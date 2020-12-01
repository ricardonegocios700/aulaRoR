json.extract! person, :id, :name, :nickname, :email, :telephone, :rg, :cpf, :cnpj, :ie, :address_id, :contact_id, :person_type_id, :shift_id, :user_id, :excluded, :created_at, :updated_at
json.url person_url(person, format: :json)

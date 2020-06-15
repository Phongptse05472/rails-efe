json.extract! user, :id, :Name, :Email, :PhoneNumber, :RollNumber, :RoleID, :Avata, :Password, :IsActive, :created_at, :updated_at
json.url user_url(user, format: :json)

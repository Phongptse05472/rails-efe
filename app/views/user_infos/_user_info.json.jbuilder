json.extract! user_info, :id, :role_id, :name, :phone_number, :roll_number, :avata, :is_active, :created_at, :updated_at
json.url user_info_url(user_info, format: :json)

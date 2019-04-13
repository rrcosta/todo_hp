json.extract! todo_list, :id, :title, :description, :done, :user_id, :created_at, :updated_at
json.url todo_list_url(todo_list, format: :json)

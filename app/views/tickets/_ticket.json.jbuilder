json.extract! ticket, :id, :name, :comment, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)

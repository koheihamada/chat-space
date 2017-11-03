json.array! @messages do |message|
  json.image message.image.url
  json.body message.body
  json.created_at message.created_at.strftime("%Y/%m/%d %H:%M")
  json.id message.id
  json.name message.user.name
end

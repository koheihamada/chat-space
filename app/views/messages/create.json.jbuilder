json.body @message.body
json.image @message.image.url
json.name current_user.name
json.created_at @message.created_at.strftime("%Y/%m/%d %H:%M") 
json.id @message.id

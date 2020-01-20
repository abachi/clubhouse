This is an exclusive clubhouse where members can write embarrassing posts about non-members. Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

#### Models:
User
name:string [presence, min: 4]
email:string [presence, email_format]
-----------------
has_many posts

Post
title:string [presence]
body:text [presence]
user_id:integer [presence]
-----------------
belongs_to user

User.destroy_all
Topic.destroy_all

chas = User.create({
  id: SecureRandom.urlsafe_base64,
  name: "Charles Munat",
  email: "charles.munat@gmail.com",
  password: "!Q2w#E4r",
  password_confirmation: "!Q2w#E4r"
})

topic1 = Topic.create({
  id: SecureRandom.urlsafe_base64,
  title: "Personal criteria",
  user: chas
})

topic2 = Topic.create({
  id: SecureRandom.urlsafe_base64,
  title: "Niche",
  user: chas
})

topic3 = Topic.create({
  id: SecureRandom.urlsafe_base64,
  title: "Something else",
  user: chas
})

note1 = Note.create({
  id: SecureRandom.urlsafe_base64,
  title: "Charles's criteria",
  content: "Who is the man who would risk his neck for his brother man?",
  user_name: chas.name,
  user_id: chas.id,
  topic: topic1
})
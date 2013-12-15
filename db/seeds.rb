User.destroy_all

chas = User.create({
  id: SecureRandom.urlsafe_base64,
  name: "Charles Munat",
  email: "charles.munat@gmail.com",
  password: "!Q2w#E4r",
  password_confirmation: "!Q2w#E4r"
})
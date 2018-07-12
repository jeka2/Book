test_user = User.create!(
  email: "a@a.com",
  password: "password",
  first_name: "FirstName",
  last_name: "LastName",
  confirmed_at: Time.now
)

test_books = 10.times do
  Book.create!(
    name: Faker::Book.title,
    description: Faker::Book.genre,
    user: test_user,
    current_page: 1,
    finished: false
  )
end


p "seeded"

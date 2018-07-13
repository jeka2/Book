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
    author: Faker::Name.name,
    publisher: Faker::FunnyName.name,
    publish_date: Faker::Date.between(30.years.ago, Date.today),
    description: Faker::Book.genre,
    user: test_user,
    current_page: 1,
    finished: false
  )
end

p "seeded"

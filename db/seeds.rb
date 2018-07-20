test_user = User.create!(
  email: "a@a.com",
  password: "password",
  first_name: "FirstName",
  last_name: "LastName",
  confirmed_at: Time.now
)

10.times do 
  Message.create!(
    content: "Hi",
    user: test_user
    )
end

10.times do 
  Author.create!(
    name: Faker::Name.name,
    biography: Faker::Simpsons.character
    )
end

authors = Author.all



test_books = 10.times do
  Book.create!(
    name: Faker::Book.title,
    publisher: Faker::FunnyName.name,
    publish_date: Faker::Date.between(30.years.ago, Date.today),
    chapter: 30,
    description: Faker::Book.genre,
    author: authors.sample,
    user: test_user,
    current_page: 1,
    finished: false
  )
end

p "seeded"

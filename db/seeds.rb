test_user = User.create!(
  email: "a@a.com",
  password: "password",
  first_name: "Tester1",
  last_name: "LastName",
  confirmed_at: Time.now
)

10.times do 
  Author.create!(
    name: Faker::Name.name,
    biography: Faker::Simpsons.character
    )
end

authors = Author.all

test_book = 
Book.create!(
    name: "Test",
    publisher: Faker::FunnyName.name,
    publish_date: Faker::Date.between(30.years.ago, Date.today),
    description: Faker::Book.genre,
    author: authors.sample,
    user: test_user,
    current_page: 1,
    finished: false
  )

test_books = 50.times do
  Book.create!(
    name: Faker::Book.title,
    publisher: Faker::FunnyName.name,
    publish_date: Faker::Date.between(30.years.ago, Date.today),
    description: Faker::Book.genre,
    author: authors.sample,
    user: test_user,
    current_page: 1,
    finished: false
  )

  
end

30.times do 
  Chapter.create!(
      book: test_book,
      name: Faker::FunnyName.name
    )
end

test_user2 = User.create!(
  email: "b@b.com",
  password: "password",
  first_name: "Tester2",
  last_name: "LastName",
  confirmed_at: Time.now
)

test_user3 = User.create!(
  email: "c@c.com",
  password: "password",
  first_name: "Tester3",
  last_name: "LastName",
  confirmed_at: Time.now
  )

10.times do 
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Simpsons.character,
    last_name: "",
    confirmed_at: Time.now
    )
end

10.times do 
  Message.create!(
    content: "Hi",
    user: test_user
    )
end




p "seeded"

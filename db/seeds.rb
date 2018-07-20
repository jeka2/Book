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
    chapter: 30,
    description: Faker::Book.genre,
    author: authors.sample,
    user: test_user,
    current_page: 1,
    finished: false
  )

50.times do
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

test_group = Group.create!(
  name: Faker::Simpsons.character,
  user: test_user
  )

test_user2 = User.create!(
  email: "b@b.com",
  password: "password",
  first_name: "Tester2",
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

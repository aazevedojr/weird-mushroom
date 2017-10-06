# Clean up:
User.delete_all
Challenge.delete_all
Course.delete_all
Review.delete_all

# Me:
User.create(
  username: "gus",
  email: "gus@weirdmushroom.net",
  password: "gus"
)

# Users:
10.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password"
  )
end

#Challenges:
Challenge.create(
  theme: Faker::Job.key_skill,
  guidelines: Faker::TwinPeaks.quote,
  course_submissions_deadline: DateTime.now.next_day(7),
  review_submissions_deadline: DateTime.now.next_day(14),
  proposer: User.all.sample
)
Challenge.create(
  theme: Faker::RockBand.name,
  guidelines: Faker::Simpsons.quote,
  course_submissions_deadline: DateTime.now.next_day(10),
  review_submissions_deadline: DateTime.now.next_day(15),
  proposer: User.all.sample
)

# Courses:
User.all.each do |user|
  Course.create(
    bookmark: "0000-0000-0000-0000",
    title: Faker::Book.title,
    maker: user,
    challenge: Challenge.first
  )
  Course.create(
    bookmark: "0000-0000-0000-0000",
    title: Faker::Pokemon.move,
    maker: user,
    challenge: Challenge.second
  )
  puts "Added two courses by #{user.username}."
end

# Reviews:
User.all.each do |user|
  courses = Course.all
  courses.delete(user.courses)
  courses.each do |course|
    Review.create(
      rating: rand(5),
      feedback: Faker::HarryPotter.quote,
      reviewer: user,
      course: course
    )
  end
end

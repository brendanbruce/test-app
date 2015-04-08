require 'faker'

if Post.count < 50
  50.times do
    Post.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph
    )
  end
end

posts = Post.all

if Comment.count < 100
  100.times do
    Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
  end
end

p = Post.find_by title: "We Guns"

if p
  puts "We Guns already created"
else
  Post.create!(
    title: "We Guns",
    body: "Machine gun kelly"
  )
end


c = Comment.find_by body: "You Suck!"

if c
  puts "You Suck already created!"
else
  Comment.create!(
    post: posts.sample,
    body: "You Suck!"
  )
end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

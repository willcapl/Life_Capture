# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# require 'faker'

# RELATIONSHIP = %w(myself relative)
# QUESTIONS = [
#   "What is the greatest accomplishment of your life?",
#   " Is there something that you’ve dreamed of doing for a long time? Why haven’t you done it?",
#   "What is your most treasured memory?",
#   "Given the choice of anyone in the world, whom would you want as a dinner guest?",
#   "What would constitute a 'perfect' day for you?",
#   "When did you last sing to yourself? To someone else?",
#   "If a crystal ball could tell you the truth about yourself, your life, the future, or anything else, what would you want to know?",
#   "What, if anything, is too serious to be joked about?"

puts "Destroying all content in database"
SubUser.destroy_all
User.destroy_all
Question.destroy_all
ResponseBookmark.destroy_all
Playlist.destroy_all

# puts "Generating some users"
# 8.times do |i|
#   user = User.new(
#     username: "user#{i + 1}",
#     email: "user#{i + 1}@email.com",
#     password: "123456"
#   )
#   user.save!

#   puts "Created user with username: #{user.username}"

#   rand(0..2).times do
#     sub_user = SubUser.new(
#       user_id: user.id,
#       relationship_to_user: RELATIONSHIP.sample,
#       name: Faker::Name.first_name,
#       dob: Faker::Date.between(from: '1910-01-01', to: '2005-12-30'),
#       childhood_location: Faker::Address.city,
#       post_education: Faker::Educator.course_name,
#       birthplace: Faker::Address.city,
#       career: Faker::Job.field,
#       adult_life_location: Faker::Address.country,
#       hobbies: Faker::Hobby.activity,
#       life_after_retirement: Faker::Hobby.activity
#     )
#     sub_user.save!

#     puts "Created subusers for #{user.username}"
#     QUESTIONS.each do |question|
#       question = Question.new(
#         title: question,
#         sub_user_id: sub_user.id
#       )
#       question.save!
#     end
#   end
# end

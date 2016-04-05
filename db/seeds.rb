require 'random_data'

 # Create Posts
 50.times do
 # #1
 Advertisement.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

 advertisements = Advertisement.all

 # Create Comments
 # #3


 puts "Seed finished"
 puts "#{Advertisement.count} advertisements created"

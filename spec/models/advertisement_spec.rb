require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Advertisement Title", body: "New Advertisement Text", price: 5) }

   describe "attributes" do
 # #2
     it "responds to title" do
       expect(advertisement).to respond_to(:title)
     end
 # #3
     it "responds to body" do
       expect(advertisement).to respond_to(:body)
     end

     it "responds to body" do
       expect(advertisement).to respond_to(:price)
     end

   end

end

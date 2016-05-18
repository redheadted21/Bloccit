require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { rand(11) }
 # #3
  let(:topic) { Topic.create!(name: name, description: description) }
 # #4
  let(:sponsoredpost) { topic.sponsored_posts.create!(title: title, body: body, price: price) }

  it { is_expected.to belong_to(:topic) }
 # #2
  describe "attributes" do
    it "has title, body and price attributes" do
      expect(sponsoredpost).to have_attributes(title: title, body: body, price: price)
    end
  end
end

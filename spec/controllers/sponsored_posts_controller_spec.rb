require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let (:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  let (:my_sponsoredpost) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(11)) }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to render_template :show
    end

    it "assigns my_sponsoredpost to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(assigns(:sponsored_post)).to eq(my_sponsoredpost)
    end

  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
        get :new, topic_id: my_topic.id
        expect(response).to render_template :new
      end

 # #3
    it "instantiates @sponsored_post" do
        get :new, topic_id: my_topic.id
        expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "POST create" do
 # #4
    it "increases the number of SponsoredPost by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(11)}}.to change(SponsoredPost,:count).by(1)
    end

 # #5
    it "assigns the new post to @sponsored_post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(11)}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end

 # #6
    it "redirects to the new sponsored post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(11)}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end


  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
 # #1
       expect(response).to render_template :edit
     end

 # #2
     it "assigns post to be updated to @sponsored_post" do
       get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id

       post_instance = assigns(:sponsored_post)

       expect(post_instance.id).to eq my_sponsoredpost.id
       expect(post_instance.title).to eq my_sponsoredpost.title
       expect(post_instance.body).to eq my_sponsoredpost.body
     end

  end

end

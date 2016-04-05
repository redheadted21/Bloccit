require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_advertisement) { Advertisement.create!(title: "New Advertisement", body: "Advertisement Info", price: 5) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisement] to @advertisements" do
      get :index
# #9
      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show, id: my_advertisement.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_advertisement.id}
      expect(response).to render_template :show
    end

     it "assigns my_advertisement to @advertisement" do
       get :show, {id: my_advertisement.id}
 # #18
       expect(assigns(:advertisement)).to eq(my_advertisement)
     end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

 # #3
    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end


  end

  describe "POST create" do
 # #4
      it "increases the number of Post by 1" do
        expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
      end

 # #5
      it "assigns the new post to @post" do
        post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:post)).to eq Post.last
      end

 # #6
      it "redirects to the new post" do
        post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to Post.last
      end
    end

end

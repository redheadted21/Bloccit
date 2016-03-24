require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:advertisement) { Advertisement.create!(title: "New Advertisement", body: "Advertisement Info", price: 5) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [advertisement] to @advertisements" do
      get :index
# #9
      expect(assigns(:advertisements)).to eq([advertisement])
    end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show, id: advertisement.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end

require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:my_question) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: random_boolean = [true, false].sample)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_question] to @questions" do

       get :index
 # #9
       expect(assigns(:questions)).to eq([my_question])

    end
  end




  describe "GET new" do
    it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
    end

 # #2
    it "renders the #new view" do
        get :new
        expect(response).to render_template :new
    end

 # #3
    it "instantiates @question" do
        get :new
        expect(assigns(:question)).not_to be_nil
    end
  end

  describe "POST create" do
 # #4
    it "increases the number of Question by 1" do
      expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: random_boolean = [true, false].sample}}.to change(Question,:count).by(1)
    end

 # #5
    it "assigns the new question to @question" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: random_boolean = [true, false].sample}
      expect(assigns(:question)).to eq Question.last
    end

 # #6
    it "redirects to the new question" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: random_boolean = [true, false].sample}
      expect(response).to redirect_to Question.last
    end
  end

  describe "GET show" do
     it "returns http success" do
 # #16
       get :show, {id: my_question.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
 # #17
       get :show, {id: my_question.id}
       expect(response).to render_template :show
     end

     it "assigns my_post to @post" do
       get :show, {id: my_question.id}
 # #18
       expect(assigns(:question)).to eq(my_question)
     end
   end

end

#  describe "GET #edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end

# end

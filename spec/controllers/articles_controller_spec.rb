require 'spec_helper'

describe ArticlesController do

  describe 'Role Admin' do

    before(:each) do
      sign_in(@user = FactoryGirl.create(:admin))
    end

    def valid_attributes
      {
          title: "My article",
          text: "MY text for article",
          admin_id: 1,
          user_id: nil,
          approved: true
      }
    end

    describe "GET index" do
      it "Index" do
        article = Article.create! valid_attributes
        get :index, {}
        assigns(:articles).should eq([article])
      end
    end

    describe "GET show" do
      it "Show" do
        article = Article.create! valid_attributes
        get :show, {:id => article.to_param}
        assigns(:article).should eq(article)
      end
    end

    describe "GET edit" do
      it "Edit" do
        article = Article.create! valid_attributes
        get :edit, {:id => article.to_param}
        assigns(:article).should eq(article)
      end
    end

    describe "POST create" do
      describe "valid" do
        it "creates a new Article" do
          expect {
            post :create, {:article => valid_attributes}
          }.to change(Article, :count).by(1)
        end

        it "assigns a newly created article as @article" do
          post :create, {:article => valid_attributes}
          assigns(:article).should be_a(Article)
          assigns(:article).should be_persisted
        end

        it "redirects to the created article" do
          post :create, {:article => valid_attributes}
          response.should redirect_to(articles_path)
        end
      end

      describe "Invalid" do
        it "assigns a newly created but unsaved article as @article" do
          Article.any_instance.stub(:save).and_return(false)
          post :create, {:article => { "text" => "" }}
          assigns(:article).should be_a_new(Article)
        end

        it "re-renders the 'new' template" do
          Article.any_instance.stub(:save).and_return(false)
          post :create, {:article => { "text" => "" }}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "Valid" do
        it "updates Article" do
          article = Article.create! valid_attributes
          Article.any_instance.should_receive(:update_attributes).with({ "text" => "My text" })
          put :update, {:id => article.to_param, :article => { "text" => "My text" }}
        end

        it "assigns the requested article as @article" do
          article = Article.create! valid_attributes
          put :update, {:id => article.to_param, :article => valid_attributes}
          assigns(:article).should eq(article)
        end

        it "redirects to the article" do
          article = Article.create! valid_attributes
          put :update, {:id => article.to_param, :article => valid_attributes}
          response.should redirect_to(articles_path)
        end
      end

      describe "Invalid" do
        it "assigns the article as @article" do
          article = Article.create! valid_attributes
          Article.any_instance.stub(:save).and_return(false)
          put :update, {:id => article.to_param, :club => { "text" => "" }}
          assigns(:article).should eq(article)
        end

        it "re-renders the 'edit' template" do
          article = Article.create! valid_attributes
          Article.any_instance.stub(:save).and_return(false)
          put :update, {:id => article.to_param, :article => { "text" => "" }}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "Destroy" do
        article = Article.create! valid_attributes
        expect {
          delete :destroy, {:id => article.to_param}
        }.to change(Article, :count).by(-1)
      end
    end
  end

  describe 'Role User' do

    before(:each) do
      sign_in(@user = FactoryGirl.create(:user))
    end

    def valid_attributes
      {
          title: "My article",
          text: "MY text for article",
          admin_id: nil,
          user_id: 1,
          approved: false
      }
    end

    describe "GET index" do
      it "Index" do
        article = Article.create! valid_attributes
        get :index, {}
        assigns(:articles).should_not eq([article])
      end
    end

    describe "GET show" do
      it "Show" do
        article = Article.create! valid_attributes
        get :show, {:id => article.to_param}
        assigns(:article).should eq(article)
      end
    end

    describe "GET edit" do
      it "Edit" do
        article = Article.create! valid_attributes
        get :edit, {:id => article.to_param}
        assigns(:article).should_not eq(article)
      end
    end

    describe "POST create" do
      describe "valid" do
        it "creates a new Article" do
          expect {
            post :create, {:article => valid_attributes}
          }.to change(Article, :count).by(1)
        end

        it "assigns a newly created article as @article" do
          post :create, {:article => valid_attributes}
          assigns(:article).should be_a(Article)
          assigns(:article).should be_persisted
        end

        it "redirects to the created article" do
          post :create, {:article => valid_attributes}
          response.should redirect_to(root_path)
        end
      end

      describe "Invalid" do
        it "assigns a newly created but unsaved article as @article" do
          Article.any_instance.stub(:save).and_return(false)
          post :create, {:article => { "text" => "" }}
          assigns(:article).should be_a_new(Article)
        end

        it "re-renders the 'new' template" do
          Article.any_instance.stub(:save).and_return(false)
          post :create, {:article => { "text" => "" }}
          response.should render_template("new")
        end
      end
    end

    describe "DELETE destroy" do
      it "Destroy" do
        article = Article.create! valid_attributes
        expect {
          delete :destroy, {:id => article.to_param}
        }.to change(Article, :count).by(0)
      end
    end
  end
end

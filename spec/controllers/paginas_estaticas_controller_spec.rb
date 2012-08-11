require 'spec_helper'

describe PaginasEstaticasController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'ayuda'" do
    it "returns http success" do
      get 'ayuda'
      response.should be_success
    end
  end

  describe "GET 'contacto'" do
    it "returns http success" do
      get 'contacto'
      response.should be_success
    end
  end

end

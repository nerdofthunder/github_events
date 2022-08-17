require 'rails_helper'

RSpec.describe "RepositoryEvents", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/repository_events/index"
      expect(response).to have_http_status(:success)
    end
  end

end

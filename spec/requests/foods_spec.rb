require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  describe 'GET /index' do
   

    it 'returns http success' do
      visit foods_path
      expect(response).to have_http_status(:success)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'Mark', email: 'marcos@gmail.com')
    end

    it 'creates user with name' do
      expect(@user.name).to eq('Mark')
    end
  end
end

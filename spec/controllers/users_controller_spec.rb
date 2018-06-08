require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user1) { User.create(name: 'Michael', email: 'michael@surkus.com', birth_date: Date.parse('Aug 21 1989')) }
  let!(:user2) { User.create(name: 'Paul', email: 'test@surkus.com', birth_date: Date.parse('Aug 21 1997')) }

  describe '#index' do
    let!(:admin) { Fabricate(:admin) }
    before do
     sign_in admin
    end

    it 'returns a array of users that are 21 and over to an authenticated admin' do

      post :admin_search, params: { :search => '21+' }
      expect(JSON.parse(response.body)).to match_array([
        { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email, 'age' => user1.age }
      ])
    end
    it 'returns an array of users that are between 21 and 35 to an authenticated admin' do
      post :admin_search, params: { :search => '21-35' }
      expect(JSON.parse(response.body)).to match_array([
        { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email, 'age' => user1.age  }
      ])
    end
    it 'returns an array of users that are 21 to an authenticated admin' do
      post :admin_search, params: { :search => '21' }
      expect(JSON.parse(response.body)).to match_array([])
    end
    it 'returns an array of users that are 35 and below to an authenticated admin' do
      post :admin_search, params: { :search => '35-' }
      expect(JSON.parse(response.body)).to match_array([
        { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email, 'age' => user1.age  },
        { 'id' => user2.id, 'name' => user2.name, 'email' => user2.email, 'age' => user2.age  }
      ])
      # expect(JSON.parse(response.body)).to match_array([
      #   { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email },
      #   { 'id' => user2.id, 'name' => user2.name, 'email' => user2.email }
      # ])
    end
  end
end

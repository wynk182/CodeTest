require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user1) { User.create(name: 'Michael', email: 'michael@surkus.com', birth_date: Date.parse('Aug 21 1989')) }
  let!(:user2) { User.create(name: 'Paul', email: 'paul@surkus.com', birth_date: Date.parse('Aug 21 1997')) }

  describe '#index' do
    it 'returns a list of users' do
      params = { :search => '21+' }
      post :admin_search, params: params
      expect(JSON.parse(response.body)).to match_array([
                                                           { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email }
                                                       ])
      params = { :search => '21-35' }
      post :admin_search, params: params
      expect(JSON.parse(response.body)).to match_array([
                                                           { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email }
                                                       ])
      params = { :search => '21' }
      post :admin_search, params: params
      expect(JSON.parse(response.body)).to match_array([])

      params = { :search => '35-' }
      post :admin_search, params: params

      expect(JSON.parse(response.body)).to match_array([
                                                           { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email },
                                                           { 'id' => user2.id, 'name' => user2.name, 'email' => user2.email }
      ])
      # expect(JSON.parse(response.body)).to match_array([
      #   { 'id' => user1.id, 'name' => user1.name, 'email' => user1.email },
      #   { 'id' => user2.id, 'name' => user2.name, 'email' => user2.email }
      # ])
    end
  end
end

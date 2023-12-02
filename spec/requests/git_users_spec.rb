require 'rails_helper'

RSpec.describe "GitUsers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/git_users"
      expect(response).to be_successful
    end
  end

  describe "GET git_users/show" do
    it "returns http success" do
      post "/git_users/show", params: { gitLogin: 'Aztec0' }
      expect(response).to be_successful
    end
  end

  it 'assigns the correct variables' do
    post "/git_users/show", params: { gitLogin: 'Aztec0' }
    expect(assigns(:gitLogin)).to eq('Aztec0')
  end

  it 'assigns user data from GraphQL query' do
    allow(GraphqlSchema).to receive(:execute).and_return(
      'data' => { 'gitUser' => { 'name' => 'Example User', 'repos' => ['repo1', 'repo2'] } }
    )

    post "/git_users/show", params: { gitLogin: 'example_user' }
    
    expect(assigns(:user_data)).to eq('data' => { 'gitUser' => { 'name' => 'Example User', 'repos' => ['repo1', 'repo2'] } })
  end
end

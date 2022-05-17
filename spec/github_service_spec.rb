require './lib/github_service'
require 'pry'

RSpec.describe GithubService do 

  it 'returns response' do 
  	response = GithubService.get_user
  	expect(response).to have_key(:login)
  	expect(response[:login]).to eq('kg-byte')
  end

  # it 'returns response' do 
  # 	user_data = JSON.parse(File.read('lib/user_response.json'), symbolize_names: true)
  # 	allow(GithubService).to receive(:get_user).and_return(user_data)

  #   response = GithubService.get_user
  # 	expect(response).to have_key(:login)
  # 	expect(response[:login]).to eq('kg-byte')
  # end 
end
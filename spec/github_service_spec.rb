require './lib/github_service'
require 'pry'

RSpec.describe GithubService do 

  it 'returns response' do 
  	response = GithubService.get_user
  	expect(response).to have_key(:login)
  	expect(response[:login]).to eq('kg-byte')
  end

end

require './lib/github_service'
require 'pry'

RSpec.describe GithubService do 

  it 'returns response' do 
  	response = GithubService.get_user
  	expect(response).to have_key(:login)
  	expect(response[:login]).to eq('kg-byte')
  end

  xit 'returns response' do 
  	# use JSON to parse a fixutre file with appropriate response
  	# syntax JSON.parse(File.read('dir')), symbolize_names: true)
  	# user_data = 

  	#stub GithubService.get_user with user_data below:
  	# allow(GithubService).to....

    response = GithubService.get_user 
    # this would be called in Facade/controller later
  	expect(response).to have_key(:login)
  	expect(response[:login]).to eq('kg-byte')
  end 
end
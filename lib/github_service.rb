require 'httparty'

require 'json'

class GithubService
  def self.get_user
    get_url('users/kg-byte')
  end



  def self.get_url(url)
    # sleep 3
    
    response = HTTParty.get("https://api.github.com/#{url}")

    JSON.parse(response.body, symbolize_names: true) 
  end


end
require 'oauth'
require 'json'
require_relative "util"
class Zaim

  API_BASE = 'https://api.zaim.net/v2/'
  API_PAYMENT = API_BASE + 'home/money/payment'
  API_INCOME  = API_BASE + 'home/money/income'

  # ZaimAPIへのアクセストークンを生成する
  def initialize
    api_key = Util.get_api_key
    oauth_params = {
      site: "https://api.zaim.net",
      request_token_path: "/v2/auth/request",
      authorize_url: "https://auth.zaim.net/users/auth",
      access_token_path: "https://api.zaim.net"
    }
    @consumer = OAuth::Consumer.new(api_key["key"], api_key["secret"], oauth_params)
    @access_token = OAuth::AccessToken.new(@consumer, api_key["access_token"], api_key["access_token_secret"])
  end

  # ZaimAPIにPOSTする
  def post(url, params)
    @access_token.post(url, params)
  end

end

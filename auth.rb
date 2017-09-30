# authentication.rb
module Precious
  class App < Sinatra::Base
    use Rack::Auth::Basic, "Restricted Area" do |username, password|
      [username, password] == [ENV['USERNAME'], ENV['PASSWORD']]
    end
  end
end

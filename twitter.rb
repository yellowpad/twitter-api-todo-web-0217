require 'twitter'
require 'yaml'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end
  
  def get_friends
     client.friends
  end

  def most_recent_friend
    #client.followers("gem")
    #client.followers(2448471445)
    client.friends.first
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
  end

  def find_user_for(username)
    #find the twitter gem method that returns the correct user, given a username
    client.user(username)
  end

  def find_followers_for(username)
    #find the twitter gem method that returns the follows of a given user
    #client.followers("gem")
    #client.followers(2448471445)
    client.followers(username).take(10)
  end

  def homepage_timeline
    client.home_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
  end
end
#Bonus: 

# uncomment out the following and read the bonus instructions.
# remember to comment out the WebMock line of your spec_helper, as the instructions dictate.

# tweet_client = TwitterApi.new
# puts tweet_client.most_recent_friend
# puts tweet_client.find_user_for("USERNAME HERE")
# puts tweet_client.find_followers_for("USERNAME HERE")
# puts tweet_client.homepage_timeline

#Place APIs in the config/initializers

require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC86903eb3ab2ea459c259da06a8933379'
auth_token = '1075a666245b25dca854c9f11f43a37f'

#set up client to talk to the Twilio REST API.  The $ allows all controllers, models, etc. use the client.

$client = Twilio::REST::Client.new account_sid, auth_token
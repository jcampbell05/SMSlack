require 'slackbotsy'
require 'sinatra'
require 'open-uri'

class ReceiveTextController < ActionController::Base

  def index
    # let's pretend that we've mapped this action to
    # http://localhost:3000/sms in the routes.rb file

    message_body = params["Body"]
    from_number = params["From"]

    config = {
      'channel'   => '#general',
      'name'      => 'The Wizard',
      'api_token' => 'xoxb-16016274358-R8JWOSfV9BNOfZPhLu1GfUeL'
    }

    bot = Slackbotsy::Bot.new(config) do
    end
    bot.post_message("#{message_body}")
  end
end

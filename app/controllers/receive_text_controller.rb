require 'slackbotsy'
require 'sinatra'
require 'open-uri'
require 'twilio-ruby'

class ReceiveTextController < ActionController::Base

  def initialize
    super

    @config = {
      'channel'   => '#the-team',
      'name'      => 'The Wizard',
      'api_token' => 'xoxb-16016274358-R8JWOSfV9BNOfZPhLu1GfUeL',
      'outgoing_token' => 'DqW9KhugnwefXqidAdaBhXvj'
    }
  end

  def index
    # let's pretend that we've mapped this action to
    # http://localhost:3000/sms in the routes.rb file

    message_body = params["Body"]
    from_number = params["From"]

    bot = Slackbotsy::Bot.new(@config)
    bot.post_message("#{message_body}")
  end

  def hear
    bot = Slackbotsy::Bot.new(@config) do
       hear /(.+)/ do |mdata|

        number_to_send_to = params[:number_to_send_to]

        twilio_sid = "AC4323dda0811444bd2f359135fa41e002"
        twilio_token = "8fab2a62bdc97c913c27f1d7c42e30bb"
        twilio_phone_number = "+441706304028"

        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

        @twilio_client.account.sms.messages.create(
          :from => "#{twilio_phone_number}",
          :to => "+447523279698",
          :body => "I heard #{user_name} say '#{mdata[1]}' in #{channel_name}"
        )
      end
    end

    bot.handle_item(params)
  end
end

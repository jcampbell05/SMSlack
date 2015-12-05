class ReceiveTextController < ApplicationController
  def index
    # let's pretend that we've mapped this action to
    # http://localhost:3000/sms in the routes.rb file

    message_body = params["Body"]
    from_number = params["From"]

    config = {
      'channel'   => '#general',
      'name'      => 'SMSBot',
      'api_token' => 'xoxb-16013476785-gLOKajlo2EdZKElZIedQnSeK'
    }

    bot = Slackbotsy::Bot.new(config)
    bot.say("#{from_number} -> #{message_body}")
  end
end

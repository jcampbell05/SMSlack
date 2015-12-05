class ReceiveTextControllerController < ApplicationController
  def index
    # let's pretend that we've mapped this action to
    # http://localhost:3000/sms in the routes.rb file

    message_body = params["Body"]
    from_number = params["From"]

    config = {
      'channel'   => '#general',
      'name'      => 'SMSlack',
      'api_token' => 'xoxb-16010001943-siHf7Fqs3MnP952DOwnEPRAK'
    }

    bot = Slackbotsy::Bot.new(config)
    bot.say("#{from_number} -> #{message_body}")
  end
end

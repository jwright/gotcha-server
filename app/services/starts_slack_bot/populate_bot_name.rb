module Services
  module Actions
    class PopulateBotName
      extend LightService::Action

      expects :team

      executed do |context|
        client = Slack::Web::Client.new token: context.team.bot.access_token
        response = client.users_info(user: context.team.bot.bot_id)

        context.team.bot.name = response.user.name
        context.team.bot.save
      end
    end
  end
end

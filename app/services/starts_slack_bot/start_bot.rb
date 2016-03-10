module Services
  module Actions
    class StartBot
      extend LightService::Action

      expects :team

      executed do |context|
        token = context.team.bot.access_token

        unless GotchaBot::Factory.built? token
          GotchaBot::Factory.build(token).start!
        end
      end
    end
  end
end

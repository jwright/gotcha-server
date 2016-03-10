require "light-service"
require_relative "starts_slack_bot/create_or_find_team"
require_relative "starts_slack_bot/populate_bot_name"
require_relative "starts_slack_bot/start_bot"

module Services
  class StartsSlackBot
    extend LightService::Organizer

    def self.for_auth(auth)
      with(auth: auth).reduce(
        Actions::CreateOrFindTeam,
        Actions::PopulateBotName,
        Actions::StartBot
      )
    end
  end
end

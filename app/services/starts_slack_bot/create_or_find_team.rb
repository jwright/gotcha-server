module Services
  module Actions
    class CreateOrFindTeam
      extend LightService::Action

      expects :auth
      promises :team

      executed do |context|
        team_id = context.auth["info"]["team_id"]
        team = GotchaBot::Models::Team.for_team_id(team_id)
        if team.nil?
          team = GotchaBot::Models::Team.create do |t|
            t.access_token = context.auth["credentials"]["token"]
            t.domain = context.auth["info"]["team_domain"]
            t.team_id = team_id
            t.create_bot do |bot|
              bot.bot_id = context.auth["extra"]["bot_info"]["bot_user_id"]
              bot.access_token =
                context.auth["extra"]["bot_info"]["bot_access_token"]
            end
          end
        end

        context.team = team
      end
    end
  end
end

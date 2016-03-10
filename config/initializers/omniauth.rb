Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV["SLACK_CLIENT_ID"], ENV["SLACK_SECRET"],
    scope: "bot,identify,users:read,team:read"
end

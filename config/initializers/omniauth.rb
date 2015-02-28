Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user:email,user:follow,repo,write:repo_hook,read:repo_hook,admin:repo_hook,admin:org_hook"
end

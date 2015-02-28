class GetActivity
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    Rails.logger.debug "get_activity called for user #{user.id}"
    unless user.github.nil?
      Rails.logger.debug "Getting activity for github"
      github = Github.new oauth_token: user.github.token
      github.activity.events.performed('adambutler', public: false).each do |event|
        activity = Activity.new({
          identity_id: user.github.id,
          uid: event.id,
          data: event
        })
        if activity.save
          Pusher['io'].trigger('incoming', activity)
        end
      end
    end

    user.start_get_activity
  end
end

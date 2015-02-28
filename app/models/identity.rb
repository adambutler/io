class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  has_many :activities

  def self.create_with_omniauth(auth, user)
    create({
      uid: auth['uid'],
      provider: auth['provider'],
      user_id: user.id,
      token: auth['credentials']['token'],
      url: auth['extra']['raw_info']["html_url"],
      avatar: auth['extra']['raw_info']["avatar_url"]
    })
  end
end

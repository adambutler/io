class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :identities

  after_create :start_get_activity

  def self.create_with_omniauth(info)
    create(name: info['name'])
  end

  def github
    identities.where(provider: "github").first
  end

  def start_get_activity
    GetActivity.perform_async(id)
  end
end

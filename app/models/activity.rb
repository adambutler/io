class Activity < ActiveRecord::Base
  serialize :data
  validates_uniqueness_of :uid
  belongs_to :activity
end

class Project < ActiveRecord::Base
  belongs_to :user1, class_name: "User", :foreign_key => "user1_id"
  belongs_to :user2, class_name: "User", :foreign_key => "user2_id"
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events
  serialize :emailchain
  
  scope :user1, -> (user1) { where user1: user1 }
  scope :user2, -> (user2) { where user2: user2 }
  
end

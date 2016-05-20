class Event < ActiveRecord::Base
  belongs_to :project
  serialize :equipment
end

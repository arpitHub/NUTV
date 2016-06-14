class Event < ActiveRecord::Base
  belongs_to :project
  serialize :equipment
  
  validate :equipment_overlap
  validates :starttime, :endtime, :presence => true
  
  def equipment_overlap
    Event.all.each do |event|
      if event.starttime && event.endtime && event.date && event.kind == "Shoot" && kind == "Shoot"
      if overlaps?(event) && (event.equipment & equipment) != [] && event.date == date
        errors.add(:equipment, ":There is an equipment overlap with: " + (event.equipment & equipment).to_sentence + " " + event.kind + " on " + event.date.strftime("%m/%d/%y") + " at " + event.starttime.strftime("%I:%m %p"))
      end
      end
    end
  end

  def overlaps?(other)
    (starttime - other.endtime) * (other.starttime - endtime) >= 0
  end

  end
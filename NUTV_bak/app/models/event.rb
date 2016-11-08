class Event < ActiveRecord::Base
  belongs_to :project
  serialize :equipment
  
  validate :equipment_overlap
  #validates :starttime, :presence => true
  
  def equipment_overlap
    Event.all.each do |event|
      if event.starttime && starttime && event.endtime && endtime && event.date && event.kind == "Shoot" && kind == "Shoot"
      if overlaps?(event) && (event.equipment & equipment) != [] && event.date == date
        errors.add(:equipment, "There is an equipment overlap with: " + " " + event.kind + " on " + event.date.strftime("%m/%d/%y") + " at " + event.starttime.strftime("%I:%m %p"))
        errors.add(:equipment, "Equipment: " + (event.equipment & equipment).to_sentence)
      end
      end
    end
  end

  def overlaps?(other)
    (starttime - other.endtime) * (other.starttime - endtime) >= 0
  end

  end
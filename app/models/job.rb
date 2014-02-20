class Job < ActiveRecord::Base
  attr_accessible :archived, :employer, :link, :position, :practice_area, :title
end

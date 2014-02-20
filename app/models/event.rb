class Event < ActiveRecord::Base
  attr_accessible :date, :description, :image_name, :link, :location, :position, :title
end

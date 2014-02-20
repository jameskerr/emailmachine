class Story < ActiveRecord::Base
  attr_accessible :archived, :body, :call_to_action, :image_name, :link, :position, :title, :subtitle
end
